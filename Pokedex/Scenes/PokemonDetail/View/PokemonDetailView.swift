//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/09.
//

import SwiftUI
import Entity

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                VStack {
                    AsyncImage(
                        url: pokemon.sprites.officialArtwork,
                        content: { $0.resizable() },
                        placeholder: { ProgressView() }
                    )
                        .frame(width: proxy.size.width * 0.8, height: proxy.size.width * 0.8)
                        .scaledToFit()

                    VStack(spacing: 16) {
                        TypesView(types: pokemon.types)
                        
                        HStack(spacing: 16) {
                            HeightView(height: pokemon.height)
                                .frame(maxWidth: .infinity)
                            WeightView(weight: pokemon.weight)
                                .frame(maxWidth: .infinity)
                        }

                        AbilitiesView(abilities: pokemon.abilities)
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .navigationTitle("No.\(pokemon.id.rawValue) \(pokemon.name)")
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonDetailView(pokemon: .preview())
        }
    }
}
