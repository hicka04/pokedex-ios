//
//  EvolutionChainView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import SwiftUI
import Entity
import PreviewData
import UI
import DesignSystem
import Routing

struct EvolutionChainView<PokemonDetailRouter: PokemonDetailWireframe>: View {
    let evolutionChain: EvolutionChain
    let pokemonDetailRouter: PokemonDetailRouter

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text("Evolution Chain")
                .font(.headline)

            HStack {
                Spacer()
                ChainLinkView(
                    chainLink: evolutionChain.chain,
                    pokemonDetailRouter: pokemonDetailRouter
                )
                Spacer()
            }
        }
    }
}

private extension EvolutionChainView {
    struct ChainLinkView: View {
        let chainLink: EvolutionChain.ChainLink
        let pokemonDetailRouter: PokemonDetailRouter

        var body: some View {
            VStack(spacing: .medium) {
                VStack {
                    if !chainLink.isOrigin {
                        Image(systemSymbol: .arrowtriangleDownFill)
                            .foregroundColor(.gray)
                    }
                    PokemonView(
                        pokemon: chainLink.pokemon,
                        pokemonDetailRouter: pokemonDetailRouter
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
            HStack(spacing: .small) {
                ForEach(chainLink.evolvesTo, id: \.pokemon.id) { chain in
                    ChainLinkView(
                        chainLink: chain,
                        pokemonDetailRouter: pokemonDetailRouter
                    )
                }
            }
        }
    }
}

private extension EvolutionChainView.ChainLinkView {
    struct PokemonView: View {
        let pokemon: Pokemon
        let pokemonDetailRouter: PokemonDetailRouter
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
                    pokemonDetailRouter.assembleModules(pokemon)
                }.navigationViewStyle(.stack)
            }
        }
    }
}

struct EvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionChainView(
            evolutionChain: .bulbasaur,
            pokemonDetailRouter: MockPokemonDetailRouter()
        ).previewLayout(.sizeThatFits)
    }

    private struct MockPokemonDetailRouter: PokemonDetailWireframe {
        func assembleModules(_ dependency: Pokemon) -> AnyView {
            .init(Text(dependency.name))
        }
    }
}
