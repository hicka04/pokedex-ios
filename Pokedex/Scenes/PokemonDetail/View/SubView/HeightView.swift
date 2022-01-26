//
//  HeightView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import SwiftUI
import SFSafeSymbols
import Entity

extension PokemonDetailView {
    struct HeightView: View {
        let height: Double

        var body: some View {
            HStack {
                Image(systemSymbol: .ruler)
                    .rotationEffect(.degrees(90))
                Text(String(format: "%.1f m", height))
            }
        }
    }
}

struct HeightView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.HeightView(height: Pokemon.preview().height)
            .previewLayout(.sizeThatFits)
    }
}
