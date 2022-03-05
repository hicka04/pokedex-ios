//
//  PokemonDetailSandboxApp.swift
//  Shared
//
//  Created by hicka04 on 2022/03/03.
//

import SwiftUI

@main
struct PokemonDetailSandboxApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            RootComponent().create()
        }
    }
}
