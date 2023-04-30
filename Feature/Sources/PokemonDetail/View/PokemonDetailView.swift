//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/09.
//

import SwiftUI
import Entity
import UI
import DesignSystem

struct PokemonDetailView<
    ViewModel: PokemonDetailViewModel
>: View {
    @StateObject var viewModel: ViewModel

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    var columns: [GridItem] {
        let columnCount: Int = {
            switch horizontalSizeClass {
            case .regular: return 2
            default: return 1
            }
        }()

        return .init(
            repeating: .init(
                .flexible(minimum: 80),
                spacing: .large,
                alignment: .center
            ),
            count: columnCount
        )
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: .large) {
                OfficialArtworkImage(
                    url: viewModel.viewState.pokemon.sprites.officialArtwork
                ).scaleEffect(0.8)

                VStack(alignment: .leading, spacing: .large) {
                    TypesView(
                        types: viewModel.viewState.pokemon.types,
                        axis: .horizontal
                    )

                    HStack(spacing: .medium) {
                        HeightView(height: viewModel.viewState.pokemon.height)
                        WeightView(weight: viewModel.viewState.pokemon.weight)
                    }

                    AbilitiesView(abilities: viewModel.viewState.pokemon.abilities)
                }

                VStack {
                    BaseStasView(baseStats: viewModel.viewState.pokemon.baseStats)
                    Spacer()
                }.frame(maxWidth: .infinity)

                Group {
                    if let evolutionChain = viewModel.viewState.evolutionChain {
                        EvolutionChainView(evolutionChain: evolutionChain)
                    } else {
                        Spacer()
                    }
                }.frame(maxWidth: .infinity)
            }.padding(.horizontal, .large)
        }
        .navigationTitle("No.\(viewModel.viewState.pokemon.id.rawValue) \(viewModel.viewState.pokemon.name)")
        .task {
            await viewModel.onAppear()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonDetailView(
                viewModel: MockPokemonDetailViewModel(
                    pokemon: .bulbasaur,
                    evolutionChain: .bulbasaur
                )
            )
        }
        .navigationViewStyle(.stack)
    }

    private final class MockPokemonDetailViewModel: PokemonDetailViewModel {
        let viewState: PokemonDetailViewState

        init(pokemon: Pokemon, evolutionChain: EvolutionChain?) {
            viewState = .init(
                pokemon: pokemon,
                evolutionChain: evolutionChain
            )
        }

        func onAppear() async {}
    }
}
