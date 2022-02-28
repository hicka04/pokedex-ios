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

protocol PokemonDetailViewCreatable: ViewCreatable where Parameter == Pokemon {}

final class PokemonDetailViewComponent: Component<EmptyDependency>, PokemonDetailViewCreatable {
    func create(_ pokemon: Pokemon) -> some View {
        PokemonDetailView(
            viewModel: self.viewModelComponent.create(pokemon),
            evolutionChainViewCreator: evolutionChainViewComponent
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
    var getEvolutionChainUseCaseComponent: GetEvolutionChainUseCaseComponent { get }
}

final class PokemonDetailViewModelComponent: Component<PokemonDetailViewModelDependency>, Creatable {
    func create(_ pokemon: Pokemon) -> some PokemonDetailViewModel {
        PokemonDetailViewModelImpl(
            pokemon: pokemon,
            getEvolutionChainInteractor: self.dependency.getEvolutionChainUseCaseComponent.create()
        )
    }
}
