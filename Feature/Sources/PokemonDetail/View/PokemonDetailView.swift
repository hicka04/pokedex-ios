//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/09.
//

import SwiftUI
import Entity
import Core
import DesignSystem
import DI

struct PokemonDetailView<
    ViewModel: PokemonDetailViewModel,
    EvolutionChainRouter: EvolutionChainWireframe
>: View {
    @StateObject var viewModel: ViewModel
    let evolutionChainRouter: EvolutionChainRouter

    var body: some View {
        ScrollView {
            VStack(spacing: .large) {
                AdaptiveStack(spacing: .large) {
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
                }

                AdaptiveStack(verticalAlignment: .top, spacing: .large) {
                    BaseStasView(baseStats: viewModel.viewState.pokemon.baseStats)
                        .frame(maxWidth: .infinity)

                    Group {
                        if let evolutionChain = viewModel.viewState.evolutionChain {
                            evolutionChainRouter.assembleModules(evolutionChain)
                        } else {
                            Spacer()
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 32)
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
                ),
                evolutionChainRouter: MockEvolutionChainRouter()
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

    private struct MockEvolutionChainRouter: EvolutionChainWireframe {
        func assembleModules(_ dependency: EvolutionChain) -> AnyView {
            .init(Text("\(dependency.id.rawValue)"))
        }
    }
}
