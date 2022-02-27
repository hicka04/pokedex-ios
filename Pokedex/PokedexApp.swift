//
//  PokedexApp.swift
//  Pokedex
//
//  Created by hicka04 on 2021/12/26.
//

import SwiftUI
import UseCase
import Infra

@main
struct PokedexApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            RootComponent().build()
        }
    }
}
