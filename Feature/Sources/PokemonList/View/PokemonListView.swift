//
//  PokemonListView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/03.
//

import SwiftUI
import Entity
import DI

@MainActor
struct PokemonListView<
    ViewModel: PokemonListViewModel
>: View {
    @StateObject var viewModel: ViewModel
    let pokemonDetailViewCreator: PokemonDetailViewCreatable

    @State private var tappedPokemon: Pokemon?
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let colomnCount: Int = {
            switch horizontalSizeClass {
            case .regular: return 3
            default: return 2
            }
        }()

        return ScrollView {
            LazyVGrid(
                columns: .init(
                    repeating: .init(
                        .flexible(minimum: 80),
                        alignment: .bottom
                    ),
                    count: colomnCount
                )
            ) {
                ForEach(viewModel.uiState.data ?? []) { pokemon in
                    PokemonCell(pokemon: pokemon)
                        .task {
                            await viewModel.onAppearCell(pokemon: pokemon)
                        }.onTapGesture {
                            tappedPokemon = pokemon
                        }.sheet(item: $tappedPokemon) { pokemon in
                            NavigationView {
                                pokemonDetailViewCreator.create(pokemon: pokemon)
                            }.navigationViewStyle(.stack)
                        }
                }
            }.padding(.horizontal, 32)

            if viewModel.uiState.isLoading {
                ProgressView()
            }
        }.task {
            await viewModel.onAppear()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonListView(
                viewModel: MockPokemonListViewModel(
                    uiState: .ideal([.bulbasaur])
                ),
                pokemonDetailViewCreator: MockPokemonDetailViewCreator()
            )
        }
    }

    private final class MockPokemonListViewModel: PokemonListViewModel {
        let uiState: UiState<[Pokemon], Int>

        init(uiState: UiState<[Pokemon], Int>) {
            self.uiState = uiState
        }

        func onAppear() async {}
        func onAppearCell(pokemon: Pokemon) async {}
    }

    private final class MockPokemonDetailViewCreator: PokemonDetailViewCreatable {
        func create(pokemon: Pokemon) -> AnyView {
            .init(Text(pokemon.name))
        }
    }
}
