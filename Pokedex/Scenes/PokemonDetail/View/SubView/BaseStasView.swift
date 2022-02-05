//
//  BaseStasView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/05.
//

import SwiftUI
import Entity

extension PokemonDetailView {
    struct BaseStasView: View {
        let baseStats: Pokemon.BaseStats

        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Base Stats")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 16) {
                    Text("HP: \(baseStats.hp)")
                    Text("Attack: \(baseStats.attack)")
                    Text("Defense: \(baseStats.defense)")
                    Text("SpecialAttack: \(baseStats.specialAttack)")
                    Text("SpecialDefense: \(baseStats.specialDefense)")
                    Text("Speed: \(baseStats.speed)")
                }.padding(.leading, 16)
            }
        }
    }
}

struct BaseStasView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.BaseStasView(baseStats: .preview())
            .previewLayout(.sizeThatFits)
    }
}
