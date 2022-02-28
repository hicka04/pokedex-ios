//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/09.
//

import SwiftUI
import Entity
import UseCase
import Infra
import Core
import DesignSystem

struct PokemonDetailView<
    ViewModel: PokemonDetailViewModel,
    EvolutionChainViewCreator: EvolutionChainViewCreatable
>: View {
    @StateObject var viewModel: ViewModel
    let evolutionChainViewCreator: EvolutionChainViewCreator

    var body: some View {
        ScrollView {
            VStack {
                OfficialArtworkView(url: viewModel.pokemon.sprites.officialArtwork)

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
                        evolutionChainViewCreator.create(evolutionChain)
                    }
                }
            }
            .padding(.horizontal, 32)
        }
        .navigationTitle("No.\(viewModel.pokemon.id.rawValue) \(viewModel.pokemon.name)")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonDetailView(
                viewModel: PokemonDetailViewModelImpl(
                    pokemon: .bulbasaur,
                    getEvolutionChainInteractor: GetEvolutionChainInteractor(
                        pokemonRepository: PokemonDataStore()
                    )
                ),
                evolutionChainViewCreator: MockEvolutionChainViewCreator()
            )
        }
    }

    private final class MockEvolutionChainViewCreator: EvolutionChainViewCreatable {
        func create(_ evolutionChain: EvolutionChain) -> some View {
            Text("\(evolutionChain.id.rawValue)")
        }
    }
}
