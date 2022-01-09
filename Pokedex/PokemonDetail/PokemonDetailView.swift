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
        Text(pokemon.name)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(
            pokemon: .init(
                id: .init(rawValue: 1),
                name: "フシギダネ",
                height: 10,
                weight: 20
            )
        )
    }
}
