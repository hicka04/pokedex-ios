//
//  EvolutionChainViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import SwiftUI
import Entity
import NeedleFoundation

protocol EvolutionChainViewBuildable: ViewBuildable where Parameter == EvolutionChain {}

final class EvolutionChainViewComponent: Component<EmptyDependency>, EvolutionChainViewBuildable {
    let pokemonDetailViewComponent: PokemonDetailViewComponent

    init(parent: Scope, pokemonDetailViewComponent: PokemonDetailViewComponent) {
        self.pokemonDetailViewComponent = pokemonDetailViewComponent
        super.init(parent: parent)
    }

    func build(_ evolutionChain: EvolutionChain) -> some View {
        EvolutionChainView(evolutionChain: evolutionChain, pokemonDetailViewBuilder: pokemonDetailViewComponent)
    }
}
