//
//  AppRouter.swift
//  Pokedex
//
//  Created by hicka04 on 2022/05/31.
//

import Foundation
import Routing
import PokemonList
import PokemonDetail
import SwiftUI

struct AppRouter: Wireframe {
    let pokemonListRouter = PokemonListRouter(
        pokemonDetailRouter: PokemonDetailRouter()
    )

    func assembleModules(_ dependency: Void) -> AnyView {
        pokemonListRouter.assembleModules()
    }
}
