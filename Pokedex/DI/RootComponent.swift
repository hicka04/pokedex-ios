//
//  RootComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import NeedleFoundation
import Infra
import Repository
import SwiftUI

final class RootComponent: BootstrapComponent, ViewCreatable {
    func create(_ parameter: ()) -> some View {
        NavigationView {
            pokemonListViewComponent.create()
        }
    }

    var pokemonListViewComponent: PokemonListViewComponent{
        PokemonListViewComponent(parent: self)
    }
}

// UseCase
extension RootComponent {
    var getPokemonListUseCaseComponent: GetPokemonListUseCaseComponent {
        GetPokemonListUseCaseComponent(parent: self)
    }

    var getEvolutionChainUseCaseComponent: GetEvolutionChainUseCaseComponent {
        GetEvolutionChainUseCaseComponent(parent: self)
    }
}

// Repository
extension RootComponent {
    var pokemonRepository: PokemonRepository {
        PokemonDataStore()
    }
}
