//
//  AppRouter.swift
//  PokemonListSandbox
//
//  Created by hicka04 on 2022/06/01.
//

import Foundation
import Routing
import PokemonList
import SwiftUI
import Entity

struct AppRouter: Wireframe {
    let pokemonListRouter = PokemonListRouter(
        pokemonDetailRouter: MockPokemonDetailRouter()
    )

    func assembleModules(_ dependency: Void) -> some View {
        pokemonListRouter.assembleModules()
    }
}

extension AppRouter {
    struct MockPokemonDetailRouter: PokemonDetailWireframe {
        func assembleModules(_ dependency: Pokemon) -> some SwiftUI.View {
            Text(dependency.name)
        }
    }
}
