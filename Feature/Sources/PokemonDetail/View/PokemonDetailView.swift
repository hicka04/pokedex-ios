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
    ViewModel: PokemonDetailViewModel
>: View {
    @StateObject var viewModel: ViewModel
    let evolutionChainViewCreator: EvolutionChainViewCreatable

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                AdaptiveStack(spacing: 32) {
                    OfficialArtworkImage(
                        url: viewModel.pokemon.sprites.officialArtwork
                    ).scaleEffect(0.8)

                    VStack(alignment: .leading, spacing: 32) {
                        TypesView(
                            types: viewModel.pokemon.types,
                            axis: .horizontal
                        )

                        HStack(spacing: 16) {
                            HeightView(height: viewModel.pokemon.height)
                            WeightView(weight: viewModel.pokemon.weight)
                        }

                        AbilitiesView(abilities: viewModel.pokemon.abilities)
                    }
                }

                AdaptiveStack(verticalAlignment: .top, spacing: 32) {
                    BaseStasView(baseStats: viewModel.pokemon.baseStats)
                        .frame(maxWidth: .infinity)

                    Group {
                        if let evolutionChain = viewModel.evolutionChain {
                            evolutionChainViewCreator.create(evolutionChain: evolutionChain)
                        } else {
                            Spacer()
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 32)
        }
        .navigationTitle("No.\(viewModel.pokemon.id.rawValue) \(viewModel.pokemon.name)")
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
                evolutionChainViewCreator: MockEvolutionChainViewCreator()
            )
        }
        .navigationViewStyle(.stack)
    }

    private final class MockPokemonDetailViewModel: PokemonDetailViewModel {
        let pokemon: Pokemon
        let evolutionChain: EvolutionChain?

        init(pokemon: Pokemon, evolutionChain: EvolutionChain?) {
            self.pokemon = pokemon
            self.evolutionChain = evolutionChain
        }

        func onAppear() async {}
    }

    private final class MockEvolutionChainViewCreator: EvolutionChainViewCreatable {
        func create(evolutionChain: EvolutionChain) -> AnyView {
            .init(Text("\(evolutionChain.id.rawValue)"))
        }
    }
}
