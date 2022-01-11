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
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.pokemonList) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        HStack(spacing: 16) {
                            AsyncImage(
                                url: pokemon.sprites.other.officialArtwork.frontDefault,
                                content: { image in
                                    image.resizable()
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                                .frame(width: 80, height: 80)
                            Text(pokemon.name)
                        }
                    }
                }
            }.padding(.leading, 16)

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
