//
//  PokemonCell.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import SwiftUI
import Entity
import SFSafeSymbols

struct PokemonCell: View {
    let pokemon: Pokemon

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(
                url: pokemon.sprites.officialArtwork,
                content: { image in
                    image.resizable()
                },
                placeholder: {
                    ProgressView()
                }
            ).frame(width: 80, height: 80)
            Text(pokemon.name)
            Spacer()
            Image(systemSymbol: .chevronRight)
        }
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon:
            .init(
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
