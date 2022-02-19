//
//  PokemonCell.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import SwiftUI
import Entity
import SFSafeSymbols
import PokedexCore

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
            VStack(alignment: .leading) {
                Text("No.\(pokemon.id.rawValue)")
                    .font(.caption)
                Text(pokemon.name)
            }
            Spacer()
            Image(systemSymbol: .chevronRight)
        }
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: .preview())
            .previewLayout(.sizeThatFits)
    }
}
