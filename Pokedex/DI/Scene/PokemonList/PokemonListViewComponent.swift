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

protocol PokemonListViewBuildable: ViewBuildable where Parameter == Void {}

final class PokemonListViewComponent: Component<EmptyDependency>, PokemonListViewBuildable {
    @MainActor
    func build(_ parameter: Void) -> some View {
        PokemonListView(
            viewModel: self.pokemonListViewModelComponent.build(()),
            pokemonDetailViewBuilder: pokemonDetailViewComponent
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
    var getPokemonListComponent: GetPokemonListUseCaseComponent { get }
}

final class PokemonListViewModelComponent: Component<PokemonListViewModelDependency> {
    @MainActor
    func build(_ parameter: Void) -> some PokemonListViewModel {
        PokemonListViewModelImpl(getPokemonListInteractor: self.dependency.getPokemonListComponent.getPokemonListInteractor)
    }
}
