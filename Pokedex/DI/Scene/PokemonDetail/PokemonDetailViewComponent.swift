//
//  PokemonDetailViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import DI
import NeedleFoundation
import SwiftUI
import Entity
import DI

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
