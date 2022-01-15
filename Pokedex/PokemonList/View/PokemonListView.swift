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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.pokemonList) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        PokemonCell(pokemon: pokemon)
                            .task {
                                await viewModel.onAppearCell(pokemon: pokemon)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }

            ProgressView() // TODO: Load next page
        }
        .navigationTitle("Pokedex")
        .task {
            await viewModel.onAppear()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
