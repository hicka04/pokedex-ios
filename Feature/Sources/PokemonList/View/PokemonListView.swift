//
//  PokemonListView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/03.
//

import SwiftUI
import Entity
import UI
import Routing

@MainActor
struct PokemonListView<
    PokemonDetailRouter: PokemonDetailWireframe
>: View {
    @StateObject var viewModel: PokemonListViewModel
    let pokemonDetailViewRouter: PokemonDetailRouter

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 160), spacing: .large, alignment: .top)]) {
                ForEach(viewModel.viewState.pokemonList) { pokemon in
                    NavigationLink(value: pokemon) {
                        PokemonCell(pokemon: pokemon)
                            .task {
                                await viewModel.onAppearCell(pokemon: pokemon)
                            }
                    }
                }
            }.padding(.horizontal, .large)

            if viewModel.viewState.loadState == .loading {
                ProgressView()
            }
        }.task {
            await viewModel.onAppear()
        }
        .navigationTitle("Pokedex")
        .navigationDestination(for: Pokemon.self) { pokemon in
            pokemonDetailViewRouter.assembleModules(pokemon)
        }
    }
}

import Dependencies
import UseCase

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        NavigationStack {
            PokemonListView(
                viewModel: withDependencies {
                    $0.getPokemonListStreamUseCase = MockGetPokemonListStreamInteractor()
                } operation: {
                    .init()
                },
                pokemonDetailViewRouter: MockPokemonDetailRouter()
            )
        }
    }

    private struct MockGetPokemonListStreamInteractor: GetPokemonListStreamUseCase {
        func callAsFunction() -> AsyncThrowingStream<[Entity.Pokemon], Error> {
            .init {
                [.bulbasaur]
            }
        }
    }

    private struct MockPokemonDetailRouter: PokemonDetailWireframe {
        func assembleModules(_ dependency: Pokemon) -> some SwiftUI.View {
            Text(dependency.name.rawValue)
        }
    }
}
