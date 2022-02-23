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
import PokedexCore
import DesignSystem

struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel<GetEvolutionChainInteractor>

    init(pokemon: Pokemon) {
        _viewModel = .init(
            wrappedValue: .init(
                pokemon: pokemon,
                getEvolutionChainInteractor: .init(
                    pokemonRepository: PokemonDataStore()
                )
            )
        )
    }

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
                        EvolutionChainView(evolutionChain: evolutionChain)
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
            PokemonDetailView(pokemon: .bulbasaur)
        }
    }
}
