//
//  PokemonCell.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import SwiftUI
import Entity
import DesignSystem

public struct PokemonCell: View {
    let pokemon: Pokemon

    public init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    public var body: some View {
        VStack(spacing: .medium) {
            OfficialArtworkImage(url: pokemon.sprites.officialArtwork)

            VStack(alignment: .leading) {
                Text("No.\(pokemon.id.rawValue)")
                    .font(.caption)
                Text(pokemon.name)
            }

            TypesView(types: pokemon.types, axis: .vertical)
        }.padding(.medium)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: .bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}
