//
//  GetPokemonListStreamInteractor.swift
//  
//
//  Created by hicka04 on 2023/05/04.
//

import Foundation
import Entity
import RepositoryContainer

public protocol GetPokemonListStreamUseCase {
    func callAsFunction() -> AsyncThrowingStream<[Pokemon], Error>
}

public struct GetPokemonListStreamInteractor {
    @Dependency(\.pokemonRepository) private var pokemonRepository

    public init() {}
}

extension GetPokemonListStreamInteractor: GetPokemonListStreamUseCase {
    public func callAsFunction() -> AsyncThrowingStream<[Pokemon], Error> {
        var nextOffset: Int? = 0

        return .init { [pokemonRepository] in
            guard let offset = nextOffset else { return nil }

            let pokemonNameList = try await pokemonRepository.getPokemonList(offset: offset)
            let pokemonList = try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
                pokemonNameList.names.forEach { name in
                    taskGroup.addTask {
                        try await pokemonRepository.getPokemon(name: name)
                    }
                }

                return try await taskGroup
                    .reduce(into: [Pokemon]()) { pokemonList, result in
                        pokemonList.append(result)
                    }.sorted { $0.id.rawValue < $1.id.rawValue }
            }

            nextOffset = pokemonNameList.nextOffset

            return pokemonList
        }
    }
}
