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

public class PokemonDataStore {
    private let session: Session
    private var pokemonListNextOffset: Int?

    init(session: Session) {
        self.session = session
    }

    public convenience init() {
        let adapter = URLSessionAdapter(configuration: .default)
        let session = Session(adapter: adapter, callbackQueue: .sessionQueue)
        self.init(session: session)
    }
}

extension PokemonDataStore: PokemonRepository {
    public func getPokemonList(reset: Bool) async throws -> [Pokemon]? {
        if reset == false && pokemonListNextOffset == nil {
            return nil
        }
        
        let response = try await session.send(GetPokemonListRequest(offset: pokemonListNextOffset))
        let pokemonListElements = response.results
        pokemonListNextOffset = {
            guard
                let url = response.next,
                let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
                let offsetString = urlComponents.queryItems?.first(where: { $0.name == "offset" })?.value,
                let offset = Int(offsetString)
            else {
                return nil
            }

            return offset
        }()
        return try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
            pokemonListElements.forEach { pokemonListElement in
                taskGroup.addTask {
                    try await self.getPokemon(name: pokemonListElement.name)
                }
            }

            return try await taskGroup
                .reduce(into: [Pokemon]()) { pokemonList, result in
                    pokemonList.append(result)
                }.sorted { $0.id.rawValue < $1.id.rawValue }
        }
    }

    public func getPokemon(name: String) async throws -> Pokemon {
        try await session.send(GetPokemonRequest(name: name)).translate()
    }
}
