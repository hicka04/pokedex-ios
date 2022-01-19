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
                            .frame(width: 40, height: 40)
                        Text(pokemon.types.first.rawValue)
                    }
                    if let secondType = pokemon.types.second {
                        VStack {
                            Image(uiImage: secondType.filledImage)
                                .resizable()
                                .frame(width: 40, height: 40)
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
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("No.\(pokemon.id.rawValue) \(pokemon.name)")
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonDetailView(
                pokemon: .init(
                    id: .init(rawValue: 1),
                    name: "フシギダネ",
                    height: 10,
                    weight: 20,
                    types: .init(
                        first: .grass,
                        second: .poison
                    ),
                    sprites: .init(
                        default: .init(
                            front: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
                            back: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png")
                        )!,
                        female: nil,
                        shiny: .init(
                            front: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"),
                            back: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png")
                        )!,
                        shinyFemale: nil,
                        officialArtwork: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
                    )
                )
            )
        }
    }
}
