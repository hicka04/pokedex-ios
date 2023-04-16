//
//  WeightView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import SwiftUI
import SFSafeSymbols
import Entity
import PreviewData

struct WeightView: View {
    let weight: Double

    var body: some View {
        HStack {
            Image(systemSymbol: .scalemass)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Spacer()
            Text(String(format: "%.1f kg", weight))
            Spacer()
        }.padding(.horizontal, .xSmall)
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView(weight: Pokemon.bulbasaur.weight)
            .previewLayout(.sizeThatFits)
    }
}
