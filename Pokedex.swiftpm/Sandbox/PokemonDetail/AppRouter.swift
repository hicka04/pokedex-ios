//
//  AppRouter.swift
//  PokemonListSandbox
//
//  Created by hicka04 on 2022/06/01.
//

import Foundation
import Routing
import PokemonDetail
import SwiftUI

struct AppRouter: Wireframe {
    let pokemonDetailRouter = PokemonDetailRouter()

    func assembleModules(_ dependency: Void) -> some View {
        pokemonDetailRouter.assembleModules(.bulbasaur)
    }
}
