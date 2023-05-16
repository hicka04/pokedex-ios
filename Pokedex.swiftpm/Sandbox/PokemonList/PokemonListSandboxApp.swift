//
//  PokemonListSandboxApp.swift
//  Shared
//
//  Created by hicka04 on 2022/03/05.
//

import SwiftUI

@main @MainActor
struct PokemonListSandboxApp: App {
    let appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                appRouter.assembleModules()
            }
        }
    }
}
