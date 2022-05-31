//
//  PokemonListRouter.swift
//  
//
//  Created by hicka04 on 2022/05/31.
//

import Foundation
import Routing
import SwiftUI

public struct PokemonListRouter<PokemonDetailRouter: PokemonDetailWireframe>: PokemonListWireframe {
    private let pokemonDetailRouter: PokemonDetailRouter

    public init(pokemonDetailRouter: PokemonDetailRouter) {
        self.pokemonDetailRouter = pokemonDetailRouter
    }
    public func assembleModules(_ dependency: ()) -> AnyView {
        .init(
            PokemonListView(
                viewModel: PokemonListViewModelImpl(),
                pokemonDetailViewRouter: pokemonDetailRouter
            )
        )
    }
}
