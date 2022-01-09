//
//  PokemonListView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/03.
//

import SwiftUI
import Entity
import UseCase
import Infra

@MainActor
struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel(
        getPokemonListInteractor: GetPokemonListInteractor(
            pokemonRepository: PokemonDataStore()
        )
    )

    var body: some View {
        List(viewModel.pokemonList) { pokemon in
            NavigationLink(pokemon.name) {
                PokemonDetailView(pokemon: pokemon)
            }
        }.task {
            await viewModel.onAppear()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
