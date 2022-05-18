//
//  InjectedValues+dependencies.swift
//
//
//  Created by hicka04 on 2022/05/13.
//

import Foundation
import UseCase
import Repository
import Infra
import Entity

extension Container {
    var pokemonRepository: PokemonRepository {
        get { Self[PokemonRepositoryKey.self] }
        set { Self[PokemonRepositoryKey.self] = newValue }
    }
    private struct PokemonRepositoryKey: InjectionKey {
        static var currentValue: PokemonRepository = PokemonDataStore()
    }
}

public extension Container {
    var getPokemonListUseCase: AnyGetPokemonListUseCase {
        get { Self[GetPokemonListUseCaseKey.self] }
        set { Self[GetPokemonListUseCaseKey.self] = newValue }
    }
    private struct GetPokemonListUseCaseKey: InjectionKey {
        static var currentValue: AnyGetPokemonListUseCase = .init(
            GetPokemonListInteractor(
                pokemonRepository: Container[\.pokemonRepository]
            )
        )
    }

    var getEvolutionChainUseCase: AnyGetEvolutionChainUseCase {
        get { Self[GetEvolutionChainUseCaseKey.self] }
        set { Self[GetEvolutionChainUseCaseKey.self] = newValue}
    }
    private struct GetEvolutionChainUseCaseKey: InjectionKey {
        static var currentValue: AnyGetEvolutionChainUseCase = .init(
            GetEvolutionChainInteractor(
                pokemonRepository: Container[\.pokemonRepository]
            )
        )
    }
}
