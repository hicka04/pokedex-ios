//
//  DependencyValues+UseCases.swift
//  
//
//  Created by hicka04 on 2023/04/16.
//

import Foundation
@_exported import Dependencies
import Repository
import Infra

public extension DependencyValues {
    var pokemonRepository: PokemonRepository {
        get { self[PokemonRepositoryKey.self] }
        set { self[PokemonRepositoryKey.self] = newValue }
    }
    private enum PokemonRepositoryKey: DependencyKey {
        static let liveValue: PokemonRepository = PokemonDataStore()
    }
}
