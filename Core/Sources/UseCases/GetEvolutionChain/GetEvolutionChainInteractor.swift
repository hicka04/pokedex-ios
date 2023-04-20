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

public protocol GetEvolutionChainUseCase: UseCase
where Input == Pokemon.ID, Output == EvolutionChain {}

public struct GetEvolutionChainInteractor {
    @Dependency(\.pokemonRepository) private var pokemonRepository: PokemonRepository

    public init() {}
}

extension GetEvolutionChainInteractor: GetEvolutionChainUseCase {
    public func execute(_ input: Input) async throws -> Output {
        let species = try await pokemonRepository.getPokemonSpecies(pokemonId: input)
        return try await pokemonRepository.getEvolutionChain(id: species.evolutionChainId)
    }
}