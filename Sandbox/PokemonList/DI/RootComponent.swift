//
//  RootComponent.swift
//  PokemonListSandbox
//
//  Created by hicka04 on 2022/03/05.
//

import Foundation
import DI
import NeedleFoundation
import Infra
import Repository
import SwiftUI
import PokemonList
import Entity

final class RootComponent: BootstrapComponent {
    @MainActor
    func create() -> some View {
        pokemonListViewComponent.create()
    }
}

// MARK: - Feature
// PokemonList
extension RootComponent {
    var pokemonListViewComponent: PokemonListViewComponent {
        PokemonListViewComponent(parent: self)
    }

    var pokemonDetailViewCreator: PokemonDetailViewCreatable {
        MockPokemonDetailViewCreator()
    }

    private struct MockPokemonDetailViewCreator: PokemonDetailViewCreatable {
        func create(pokemon: Pokemon) -> AnyView {
            AnyView(Text(pokemon.name))
        }
    }
}

// MARK: - UseCase
extension RootComponent {
    var getPokemonListUseCaseComponent: GetPokemonListUseCaseComponent {
        GetPokemonListUseCaseComponent(parent: self)
    }
}

// MARK: - Repository
extension RootComponent {
    var pokemonRepository: PokemonRepository {
        PokemonDataStore()
    }
}
