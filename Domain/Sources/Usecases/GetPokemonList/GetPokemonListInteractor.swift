//
//  GetPokemonListInteractor.swift
//  
//
//  Created by hicka04 on 2022/01/03.
//

import Foundation
import Entity
import Repository

public protocol GetPokemonListUseCase: UseCase
where Input == Void, Output == [Pokemon] {}

public struct GetPokemonListInteractor: GetPokemonListUseCase {
    private let pokemonRepository: PokemonRepository

    public init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }

    public func execute(_ input: Input) async throws -> Output {
        let pokemonListElements = try await pokemonRepository.getPokemonList()
        return try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
            pokemonListElements.forEach { pokemonListElement in
                taskGroup.addTask {
                    try await pokemonRepository.getPokemon(name: pokemonListElement.name)
                }
            }

            return try await taskGroup
                .reduce(into: [Pokemon]()) { pokemonList, result in
                    pokemonList.append(result)
                }.sorted { $0.id.rawValue < $1.id.rawValue }
        }
    }
}
