//
//  EvolutionChainView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import SwiftUI
import Entity
import UI
import DesignSystem
import Routing

struct EvolutionChainView: View {
    let evolutionChain: EvolutionChain

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text("Evolution Chain")
                .font(.title2)

            HStack {
                Spacer()
                ChainLinkView(
                    chainLink: evolutionChain.chain
                )
                Spacer()
            }
        }
    }
}

private extension EvolutionChainView {
    struct ChainLinkView: View {
        let chainLink: EvolutionChain.ChainLink

        var body: some View {
            VStack(spacing: .medium) {
                VStack {
                    if !chainLink.isOrigin {
                        Image(systemSymbol: .arrowtriangleDownFill)
                            .foregroundColor(.gray)
                    }
                    NavigationLink(value: chainLink.pokemon) {
                        PokemonCell(pokemon: chainLink.pokemon)
                            .frame(width: 200)
                    }
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
            HStack(alignment: .top, spacing: .small) {
                ForEach(chainLink.evolvesTo, id: \.pokemon.id) { chain in
                    ChainLinkView(
                        chainLink: chain
                    )
                }
            }
        }
    }
}

struct EvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionChainView(
            evolutionChain: .bulbasaur
        ).previewLayout(.sizeThatFits)
    }
}
