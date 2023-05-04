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
    public func assembleModules(_ dependency: ()) -> some View {
        PokemonListView(
            viewModel: .init(),
            pokemonDetailViewRouter: pokemonDetailRouter
        )
    }
}
