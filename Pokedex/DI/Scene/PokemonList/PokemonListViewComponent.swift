//
//  PokemonListViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/26.
//

import Foundation
import SwiftUI
import Repository
import Infra
import NeedleFoundation

protocol PokemonListViewCreatable: ViewCreatable where Parameter == Void {}

final class PokemonListViewComponent: Component<EmptyDependency>, PokemonListViewCreatable {
    func create(_ parameter: Void) -> some View {
        PokemonListView(
            viewModel: self.pokemonListViewModelComponent.create(()),
            pokemonDetailViewCreator: pokemonDetailViewComponent
        )
    }

    var pokemonListViewModelComponent: PokemonListViewModelComponent {
        PokemonListViewModelComponent(parent: self)
    }

    var pokemonDetailViewComponent: PokemonDetailViewComponent {
        PokemonDetailViewComponent(parent: self)
    }
}

protocol PokemonListViewModelDependency: Dependency {
    var getPokemonListUseCaseComponent: GetPokemonListUseCaseComponent { get }
}

final class PokemonListViewModelComponent: Component<PokemonListViewModelDependency>, Creatable {
    func create(_ parameter: Void) -> some PokemonListViewModel {
        PokemonListViewModelImpl(getPokemonListInteractor: self.dependency.getPokemonListUseCaseComponent.create())
    }
}
