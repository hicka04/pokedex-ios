//
//  PokemonCell.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import SwiftUI
import Entity
import Core
import DesignSystem

struct PokemonCell: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(spacing: 16) {
            OfficialArtworkImage(url: pokemon.sprites.officialArtwork)

            VStack(alignment: .leading) {
                Text("No.\(pokemon.id.rawValue)")
                    .font(.caption)
                Text(pokemon.name)
            }
        }
        .padding(16)
        .contentShape(Rectangle())
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: .bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}
