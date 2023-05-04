//
//  GetEvolutionChainInteractor.swift
//  
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity
import Repository
import RepositoryContainer

public protocol GetEvolutionChainUseCase {
    func callAsFunction(pokemonId: Pokemon.ID) async throws -> EvolutionChain
}

public struct GetEvolutionChainInteractor {
    @Dependency(\.pokemonRepository) private var pokemonRepository

    public init() {}
}

extension GetEvolutionChainInteractor: GetEvolutionChainUseCase {
    public func callAsFunction(pokemonId: Pokemon.ID) async throws -> EvolutionChain {
        let species = try await pokemonRepository.getPokemonSpecies(pokemonId: pokemonId)
        return try await pokemonRepository.getEvolutionChain(id: species.evolutionChainId)
    }
}
