//
//  GetPokemonListInteractor.swift
//  
//
//  Created by hicka04 on 2022/01/03.
//

import Foundation
import Entity
import Repository

public enum GetPokemonListPaginationParameter {
    case first
    case next
}

public protocol GetPokemonListUseCase: UseCase
where Input == GetPokemonListPaginationParameter, Output == [Pokemon] {}

public struct GetPokemonListInteractor: GetPokemonListUseCase {
    private let pokemonRepository: PokemonRepository

    public init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }

    public func execute(_ input: Input) async throws -> Output {
        try await pokemonRepository.getPokemonList(reset: input == .first)
    }
}
