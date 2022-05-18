//
//  RootComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import DI
import NeedleFoundation
import Infra
import Repository
import SwiftUI
import PokemonList
import PokemonDetail

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
}

// PokemonDetail
extension RootComponent {
    var pokemonDetailViewComponent: PokemonDetailViewComponent {
        PokemonDetailViewComponent(parent: self)
    }

    var pokemonDetailViewCreator: PokemonDetailViewCreatable {
        pokemonDetailViewComponent
    }
}
