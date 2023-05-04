//
//  DependencyValues+UseCases.swift
//  
//
//  Created by hicka04 on 2023/04/16.
//

import Foundation
@_exported import Dependencies
import UseCase

public extension DependencyValues {
    var getPokemonListUseCase: any GetPokemonListUseCase {
        get { self[GetPokemonListUseCaseKey.self] }
        set { self[GetPokemonListUseCaseKey.self] = newValue }
    }
    private enum GetPokemonListUseCaseKey: DependencyKey {
        static let liveValue: any GetPokemonListUseCase = GetPokemonListInteractor()
    }

    var getPokemonListStreamUseCase: any GetPokemonListStreamUseCase {
        get { self[GetPokemonListStreamUseCaseKey.self] }
        set { self[GetPokemonListStreamUseCaseKey.self] = newValue }
    }
    private enum GetPokemonListStreamUseCaseKey: DependencyKey {
        static let liveValue: any GetPokemonListStreamUseCase = GetPokemonListStreamInteractor()
    }

    var getEvolutionChainUseCase: any GetEvolutionChainUseCase {
        get { self[GetEvolutionChainUseCaseKey.self] }
        set { self[GetEvolutionChainUseCaseKey.self] = newValue }
    }
    private enum GetEvolutionChainUseCaseKey: DependencyKey {
        static let liveValue: any GetEvolutionChainUseCase = GetEvolutionChainInteractor()
    }
}
