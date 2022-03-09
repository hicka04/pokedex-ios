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

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

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
                    NavigationLink {
                        pokemonDetailViewCreator.create(pokemon: pokemon)
                    } label: {
                        PokemonCell(pokemon: pokemon)
                            .onAppear {
                                viewModel.onAppearCell(pokemon: pokemon)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }.padding(.horizontal, 32)
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

        func onAppear() {}
        func onAppearCell(pokemon: Pokemon) {}
    }

    private final class MockPokemonDetailViewCreator: PokemonDetailViewCreatable {
        func create(pokemon: Pokemon) -> AnyView {
            .init(Text(pokemon.name))
        }
    }
}
