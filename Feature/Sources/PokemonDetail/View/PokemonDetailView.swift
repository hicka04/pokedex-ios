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

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel

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
                }

                if let evolutionChain = viewModel.viewState.evolutionChain {
                    EvolutionChainView(evolutionChain: evolutionChain)
                }
            }.padding(.horizontal, .large)
        }
        .navigationTitle("No.\(viewModel.viewState.pokemon.id.rawValue) \(viewModel.viewState.pokemon.name.rawValue)")
        .task {
            await viewModel.onAppear()
        }
    }
}

import Dependencies
import UseCase

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        NavigationStack {
            PokemonDetailView(
                viewModel: withDependencies {
                    $0.getEvolutionChainUseCase = MockGetEvolutionChainInteractor()
                } operation: {
                    .init(pokemon: .bulbasaur)
                }
            )
        }
    }

    private struct MockGetEvolutionChainInteractor: GetEvolutionChainUseCase {
        func callAsFunction(pokemonId: Pokemon.ID) async throws -> EvolutionChain {
            .bulbasaur
        }
    }
}
