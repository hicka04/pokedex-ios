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
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .rotationEffect(.degrees(90))
                Spacer()
                Text(String(format: "%.1f m", height))
                Spacer()
            }.padding(.horizontal, 4)
        }
    }
}

struct HeightView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.HeightView(height: Pokemon.preview().height)
            .previewLayout(.sizeThatFits)
    }
}
