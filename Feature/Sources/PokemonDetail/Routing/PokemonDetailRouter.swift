//
//  PokemonDetailRouter.swift
//  
//
//  Created by hicka04 on 2022/05/31.
//

import Foundation
import Routing
import Entity
import SwiftUI

public struct PokemonDetailRouter: PokemonDetailWireframe {
    public init() {}

    public func assembleModules(_ dependency: Pokemon) -> AnyView {
        .init(
            PokemonDetailView(
                viewModel: PokemonDetailViewModelImpl(
                    pokemon: dependency
                ),
                evolutionChainRouter: EvolutionChainRouter(pokemonDetailRouter: self)
            )
        )
    }
}
