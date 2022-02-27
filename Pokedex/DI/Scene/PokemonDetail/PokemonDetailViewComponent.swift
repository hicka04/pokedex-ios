//
//  PokemonDetailViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import SwiftUI
import NeedleFoundation
import Entity

protocol PokemonDetailViewBuildable: ViewBuildable where Parameter == Pokemon {}

final class PokemonDetailViewComponent: Component<EmptyDependency>, PokemonDetailViewBuildable {
    func build(_ pokemon: Pokemon) -> some View {
        PokemonDetailView(
            viewModel: self.viewModelComponent.build(pokemon),
            evolutionChainViewBuilder: evolutionChainViewComponent
        )
    }

    var viewModelComponent: PokemonDetailViewModelComponent {
        PokemonDetailViewModelComponent(parent: self)
    }

    var evolutionChainViewComponent: EvolutionChainViewComponent {
        EvolutionChainViewComponent(parent: self, pokemonDetailViewComponent: self)
    }
}

protocol PokemonDetailViewModelDependency: Dependency {
    var getEvolutionChainComponent: GetEvolutionChainUseCaseComponent { get }
}

final class PokemonDetailViewModelComponent: Component<PokemonDetailViewModelDependency> {
    @MainActor
    func build(_ pokemon: Pokemon) -> some PokemonDetailViewModel {
        PokemonDetailViewModelImpl(
            pokemon: pokemon,
            getEvolutionChainInteractor: self.dependency.getEvolutionChainComponent.getEvolutionChainInteractor
        )
    }
}
