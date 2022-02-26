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
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PokemonListView(
                    viewModel: PokemonListViewModelImpl(
                        getPokemonListInteractor: GetPokemonListInteractor(
                            pokemonRepository: PokemonDataStore()
                        )
                    )
                )
            }
        }
    }
}
