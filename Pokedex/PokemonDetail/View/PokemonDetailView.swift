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
        AsyncImage(
            url: pokemon.sprites.officialArtwork,
            content: { $0.resizable() },
            placeholder: { ProgressView() }
        ).scaledToFit()
            .navigationTitle(pokemon.name)
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