//
//  PokemonDataStore.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit
import Entity
import Repository

public struct PokemonDataStore {
    private let session: Session

    init(session: Session) {
        self.session = session
    }

    public init() {
        let adapter = URLSessionAdapter(configuration: .default)
        let session = Session(adapter: adapter, callbackQueue: .sessionQueue)
        self.init(session: session)
    }
}

extension PokemonDataStore: PokemonRepository {
    public func getPokemonList(offset: Int) async throws -> PokemonListPage {
        let response = try await session.send(GetPokemonListRequest(offset: offset))
        let pokemonList: [Pokemon] = try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
            response.results.forEach { pokemonListElement in
                taskGroup.addTask {
                    try await self.getPokemon(name: pokemonListElement.name)
                }
            }

            return try await taskGroup
                .reduce(into: [Pokemon]()) { pokemonList, result in
                    pokemonList.append(result)
                }.sorted { $0.id.rawValue < $1.id.rawValue }
        }
        return PokemonListPage(nextOffset: response.nextOffset, items: pokemonList)
    }

    public func getPokemon(name: String) async throws -> Pokemon {
        try await session.send(GetPokemonRequest(name: name)).translate()
    }
}
