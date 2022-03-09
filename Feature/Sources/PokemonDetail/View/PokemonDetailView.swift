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
    EvolutionChainViewCreator: EvolutionChainViewCreatable
>: View {
    @StateObject var viewModel: ViewModel
    let evolutionChainViewCreator: EvolutionChainViewCreator

    var body: some View {
        ScrollView {
            VStack {
                OfficialArtworkImage(
                    url: viewModel.pokemon.sprites.officialArtwork,
                    scale: 0.8
                )

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

                    BaseStasView(baseStats: viewModel.pokemon.baseStats)

                    if let evolutionChain = viewModel.evolutionChain {
                        evolutionChainViewCreator.create(evolutionChain: evolutionChain)
                    }
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
