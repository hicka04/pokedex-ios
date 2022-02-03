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
            VStack {
                OfficialArtworkView(url: pokemon.sprites.officialArtwork)

                VStack(spacing: 16) {
                    TypesView(types: pokemon.types)

                    HStack(spacing: 16) {
                        HeightView(height: pokemon.height)
                        WeightView(weight: pokemon.weight)
                    }

                    AbilitiesView(abilities: pokemon.abilities)
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
