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
    ViewModel: PokemonListViewModel,
    PokemonDetailRouter: PokemonDetailWireframe
>: View {
    @StateObject var viewModel: ViewModel
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

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonListView(
                viewModel: MockPokemonListViewModel(
                    viewState: .init(loadState: .partial(progress: 1), pokemonList: [.bulbasaur])
                ),
                pokemonDetailViewRouter: MockPokemonDetailRouter()
            )
        }
    }

    private final class MockPokemonListViewModel: PokemonListViewModel {
        let viewState: PokemonListViewState

        init(viewState: PokemonListViewState) {
            self.viewState = viewState
        }

        func onAppear() async {}
        func onAppearCell(pokemon: Pokemon) async {}
    }

    private struct MockPokemonDetailRouter: PokemonDetailWireframe {
        func assembleModules(_ dependency: Pokemon) -> AnyView {
            .init(Text(dependency.name))
        }
    }
}
