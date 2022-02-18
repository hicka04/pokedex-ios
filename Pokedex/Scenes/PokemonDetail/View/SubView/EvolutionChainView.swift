//
//  EvolutionChainView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import SwiftUI
import Entity

extension PokemonDetailView {
    struct EvolutionChainView: View {
        let evolutionChain: EvolutionChain

        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Evolution Chain")
                    .font(.headline)

                HStack {
                    Spacer()
                    ChainLinkView(chainLink: evolutionChain.chain)
                    Spacer()
                }
            }
        }
    }
}

private extension PokemonDetailView.EvolutionChainView {
    struct ChainLinkView: View {
        let chainLink: EvolutionChain.ChainLink

        var body: some View {
            VStack(spacing: 16) {
                VStack {
                    if !chainLink.isOrigin {
                        Image(systemSymbol: .arrowtriangleDownFill)
                            .foregroundColor(.gray)
                    }
                    PokemonView(pokemon: chainLink.pokemon)
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
                    ChainLinkView(chainLink: chain)
                }
            }
        }
    }
}

private extension PokemonDetailView.EvolutionChainView.ChainLinkView {
    struct PokemonView: View {
        let pokemon: Pokemon
        @State private var isPresented: Bool = false

        var body: some View {
            VStack {
                AsyncImage(
                    url: pokemon.sprites.officialArtwork,
                    content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    }
                ).frame(width: 160, height: 160)

                VStack(alignment: .leading) {
                    Text("No.\(pokemon.id.rawValue)")
                        .font(.caption)
                    Text(pokemon.name)
                }
            }.onTapGesture {
                isPresented = true
            }.sheet(isPresented: $isPresented) {
                NavigationView {
                    PokemonDetailView(pokemon: pokemon)
                }
            }
        }
    }
}

struct EvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.EvolutionChainView(evolutionChain: .preview())
            .previewLayout(.sizeThatFits)
    }
}
