//
//  PokedexApp.swift
//  Pokedex
//
//  Created by hicka04 on 2021/12/26.
//

import SwiftUI

@main @MainActor
struct PokedexApp: App {
    let appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            appRouter.assembleModules()
        }
    }
}
