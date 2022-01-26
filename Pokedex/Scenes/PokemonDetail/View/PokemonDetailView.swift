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
            VStack(spacing: 16) {
                AsyncImage(
                    url: pokemon.sprites.officialArtwork,
                    content: { $0.resizable() },
                    placeholder: { ProgressView() }
                ).scaledToFit()

                HStack(spacing: 16) {
                    Text("Types:")
                        .fontWeight(.bold)
                    VStack {
                        Image(uiImage: pokemon.types.first.filledImage)
                            .resizable()
                            .frame(width: 32, height: 32)
                        Text(pokemon.types.first.rawValue)
                    }
                    if let secondType = pokemon.types.second {
                        VStack {
                            Image(uiImage: secondType.filledImage)
                                .resizable()
                                .frame(width: 32, height: 32)
                            Text(secondType.rawValue)
                        }
                    }
                    Spacer()
                }

                HStack(spacing: 16) {
                    HStack(spacing: 16) {
                        Text("Height:")
                            .fontWeight(.bold)
                        Text(String(format: "%.1f m", pokemon.height))
                        Spacer()
                    }.frame(maxWidth: .infinity)
                    HStack(spacing: 16) {
                        Text("Weight:")
                            .fontWeight(.bold)
                        Text(String(format: "%.1f kg", pokemon.weight))
                        Spacer()
                    }.frame(maxWidth: .infinity)
                }

                HStack(alignment: .top, spacing: 16) {
                    Text("Abilities:")
                        .fontWeight(.bold)

                    VStack(alignment: .leading, spacing: 16) {
                        Text(pokemon.abilities.first.name)
                        if let second = pokemon.abilities.second {
                            Text(second.name)
                        }
                        if let hidden = pokemon.abilities.hidden {
                            HStack(alignment: .lastTextBaseline) {
                                Text(hidden.name)
                                Text("(Hidden)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 16)
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
