//
//  GetPokemonListInteractor.swift
//  
//
//  Created by hicka04 on 2022/01/03.
//

import Foundation
import Entity
import Repository

public typealias GetPokemonListOffset = Int

public protocol GetPokemonListUseCase: UseCase
where Input == GetPokemonListOffset, Output == PokemonListPage {}

public struct GetPokemonListInteractor: GetPokemonListUseCase {
    private let pokemonRepository: PokemonRepository

    public init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }

    public func execute(_ input: Input) async throws -> Output {
        try await pokemonRepository.getPokemonList(offset: input)
    }
}

extension GetPokemonListUseCase {
    public func execute() async throws -> Output {
        try await execute(0)
    }
}
