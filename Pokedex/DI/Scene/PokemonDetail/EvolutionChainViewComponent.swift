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

final class EvolutionChainViewComponent: Component<EmptyDependency>, EvolutionChainViewCreatable {
    let pokemonDetailViewComponent: PokemonDetailViewComponent

    init(parent: Scope, pokemonDetailViewComponent: PokemonDetailViewComponent) {
        self.pokemonDetailViewComponent = pokemonDetailViewComponent
        super.init(parent: parent)
    }

    func create(_ evolutionChain: EvolutionChain) -> some View {
        EvolutionChainView(evolutionChain: evolutionChain, pokemonDetailViewCreator: pokemonDetailViewComponent)
    }
}
