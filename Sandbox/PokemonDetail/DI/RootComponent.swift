//
//  RootComponent.swift
//  PokemonDetailSandbox
//
//  Created by hicka04 on 2022/03/03.
//

import Foundation
import DI
import NeedleFoundation
import Infra
import Repository
import SwiftUI
import PokemonDetail

final class RootComponent: BootstrapComponent {
    @MainActor
    func create() -> some View {
        NavigationView {
            pokemonDetailViewComponent.create(pokemon: .bulbasaur)
        }.navigationViewStyle(.stack)
    }
}

// MARK: - Feature
// PokemonDetail
extension RootComponent {
    var pokemonDetailViewComponent: PokemonDetailViewComponent {
        PokemonDetailViewComponent(parent: self)
    }

    var pokemonDetailViewCreator: PokemonDetailViewCreatable {
        pokemonDetailViewComponent
    }
}

// MARK: - UseCase
extension RootComponent {
    var getEvolutionChainUseCaseComponent: GetEvolutionChainUseCaseComponent {
        GetEvolutionChainUseCaseComponent(parent: self)
    }
}

// MARK: - Repository
extension RootComponent {
    var pokemonRepository: PokemonRepository {
        PokemonDataStore()
    }
}
