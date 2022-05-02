//
//  PokemonListSandboxApp.swift
//  Shared
//
//  Created by hicka04 on 2022/03/05.
//

import SwiftUI

@main
struct PokemonListSandboxApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            RootComponent().create()
        }
    }
}
