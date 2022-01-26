//
//  WeightView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import SwiftUI
import SFSafeSymbols
import Entity

extension PokemonDetailView {
    struct WeightView: View {
        let weight: Double
        
        var body: some View {
            HStack {
                Image(systemSymbol: .scalemass)
                Text(String(format: "%.1f kg", weight))
            }
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.WeightView(weight: Pokemon.preview().weight)
    }
}
