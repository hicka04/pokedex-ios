//
//  EvolutionChainRouter.swift
//  
//
//  Created by hicka04 on 2022/05/31.
//

import Foundation
import Routing
import Entity
import SwiftUI

protocol EvolutionChainWireframe: Wireframe
where Dependency == EvolutionChain {}

struct EvolutionChainRouter<PokemonDetailRouter: PokemonDetailWireframe>: EvolutionChainWireframe {
    private let pokemonDetailRouter: PokemonDetailRouter

    init(pokemonDetailRouter: PokemonDetailRouter) {
        self.pokemonDetailRouter = pokemonDetailRouter
    }

    func assembleModules(_ dependency: EvolutionChain) -> AnyView {
        .init(
            EvolutionChainView(
                evolutionChain: dependency,
                pokemonDetailRouter: pokemonDetailRouter
            )
        )
    }
}
