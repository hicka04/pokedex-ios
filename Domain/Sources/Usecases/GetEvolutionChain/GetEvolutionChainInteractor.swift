//
//  GetEvolutionChainInteractor.swift
//  
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity
import Repository

public protocol GetEvoluionChainUseCase: UseCase
where Input == Pokemon.ID, Output == EvolutionChain {}

public struct GetEvolutionChainInteractor {
    private let pokemonRepository: PokemonRepository

    public init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
}

extension GetEvolutionChainInteractor: GetEvoluionChainUseCase {
    public func execute(_ input: Input) async throws -> Output {
        let species = try await pokemonRepository.getPokemonSpecies(pokemonId: input)
        return try await pokemonRepository.getEvolutionChain(id: species.evolutionChainId)
    }
}
