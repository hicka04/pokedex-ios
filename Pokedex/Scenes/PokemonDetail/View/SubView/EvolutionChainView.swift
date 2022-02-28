//
//  EvolutionChainView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import SwiftUI
import Entity
import Core
import DesignSystem
import UseCase
import Infra
import DI

struct EvolutionChainView<PokemonDetailViewCreator: PokemonDetailViewCreatable>: View {
    let evolutionChain: EvolutionChain
    let pokemonDetailViewCreator: PokemonDetailViewCreator

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Evolution Chain")
                .font(.headline)

            HStack {
                Spacer()
                ChainLinkView(
                    chainLink: evolutionChain.chain,
                    pokemonDetailViewCreator: pokemonDetailViewCreator
                )
                Spacer()
            }
        }
    }
}

private extension EvolutionChainView {
    struct ChainLinkView: View {
        let chainLink: EvolutionChain.ChainLink
        let pokemonDetailViewCreator: PokemonDetailViewCreator

        var body: some View {
            VStack(spacing: 16) {
                VStack {
                    if !chainLink.isOrigin {
                        Image(systemSymbol: .arrowtriangleDownFill)
                            .foregroundColor(.gray)
                    }
                    PokemonView(
                        pokemon: chainLink.pokemon,

                        pokemonDetailViewCreator: pokemonDetailViewCreator
                    )
                }

                if chainLink.evolvesTo.count > 1 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        evolvesToView(chainLink.evolvesTo)
                    }
                } else {
                    evolvesToView(chainLink.evolvesTo)
                }
            }
        }

        private func evolvesToView(_ evolvesTo: [EvolutionChain.ChainLink]) -> some View {
            HStack(spacing: 8) {
                ForEach(chainLink.evolvesTo, id: \.pokemon.id) { chain in
                    ChainLinkView(
                        chainLink: chain,
                        pokemonDetailViewCreator: pokemonDetailViewCreator
                    )
                }
            }
        }
    }
}

private extension EvolutionChainView.ChainLinkView {
    struct PokemonView: View {
        let pokemon: Pokemon
        let pokemonDetailViewCreator: PokemonDetailViewCreator
        @State private var isPresented: Bool = false

        var body: some View {
            VStack {
                OfficialArtworkImage(url: pokemon.sprites.officialArtwork)
                    .frame(width: 160, height: 160)

                VStack(alignment: .leading) {
                    Text("No.\(pokemon.id.rawValue)")
                        .font(.caption)
                    Text(pokemon.name)
                }

                TypesView(types: pokemon.types, axis: .vertical)
            }.onTapGesture {
                isPresented = true
            }.sheet(isPresented: $isPresented) {
                NavigationView {
                    pokemonDetailViewCreator.create(pokemon)
                }
            }
        }
    }
}

struct EvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionChainView(
            evolutionChain: .bulbasaur,
            pokemonDetailViewCreator: MockPokemonDetailViewCreator()
        ).previewLayout(.sizeThatFits)
    }

    private final class MockPokemonDetailViewCreator: PokemonDetailViewCreatable {
        func create(_ pokemon: Pokemon) -> some View {
            Text(pokemon.name)
        }
    }
}
