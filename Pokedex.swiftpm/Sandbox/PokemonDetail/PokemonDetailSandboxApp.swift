//
//  PokemonDetailSandboxApp.swift
//  Shared
//
//  Created by hicka04 on 2022/03/03.
//

import SwiftUI

@main @MainActor
struct PokemonDetailSandboxApp: App {
    let appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            appRouter.assembleModules()
        }
    }
}
