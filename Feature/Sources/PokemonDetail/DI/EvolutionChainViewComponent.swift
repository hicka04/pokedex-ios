//
//  EvolutionChainViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import DI
import NeedleFoundation
import SwiftUI
import Entity

protocol EvolutionChainViewCreatable {
    @MainActor
    func create(evolutionChain: EvolutionChain) -> AnyView
}

final class EvolutionChainViewComponent: Component<EmptyDependency>, EvolutionChainViewCreatable {
    let pokemonDetailViewComponent: PokemonDetailViewComponent

    init(parent: Scope, pokemonDetailViewComponent: PokemonDetailViewComponent) {
        self.pokemonDetailViewComponent = pokemonDetailViewComponent
        super.init(parent: parent)
    }

    func create(evolutionChain: EvolutionChain) -> AnyView {
        .init(
            EvolutionChainView(evolutionChain: evolutionChain, pokemonDetailViewCreator: pokemonDetailViewComponent)
        )
    }
}

extension PokemonDetailViewComponent {
    var evolutionChainViewComponent: EvolutionChainViewComponent {
        EvolutionChainViewComponent(parent: self, pokemonDetailViewComponent: self)
    }
}
