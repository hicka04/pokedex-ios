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
struct PokemonListView<
    ViewModel: PokemonListViewModel,
    PokemonDetailViewCreator: PokemonDetailViewCreatable
>: View {
    @StateObject var viewModel: ViewModel
    let pokemonDetailViewCreator: PokemonDetailViewCreator

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.uiState.data ?? []) { pokemon in
                    NavigationLink {
                        pokemonDetailViewCreator.create(pokemon)
                    } label: {
                        PokemonCell(pokemon: pokemon)
                            .onAppear {
                                viewModel.onAppearCell(pokemon: pokemon)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
            if viewModel.uiState.isLoading {
                ProgressView()
            }
        }
        .navigationTitle("Pokedex")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonListView(
                viewModel: PokemonListViewModelImpl(
                    getPokemonListInteractor: GetPokemonListInteractor(
                        pokemonRepository: PokemonDataStore()
                    )
                ),
                pokemonDetailViewCreator: MockPokemonDetailViewCreator()
            )
        }
    }

    private final class MockPokemonDetailViewCreator: PokemonDetailViewCreatable {
        func create(_ pokemon: Pokemon) -> some View {
            Text(pokemon.name)
        }
    }
}
