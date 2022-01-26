//
//  TypesView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import SwiftUI
import Entity

extension PokemonDetailView {
    struct TypesView: View {
        let types: Pokemon.Types
        
        var body: some View {
            HStack(spacing: 16) {
                TypeView(type: types.first)
                if let secondType = types.second {
                    TypeView(type: secondType)
                }
            }
        }
    }
}

private extension PokemonDetailView.TypesView {
    struct TypeView: View {
        let type: Pokemon.`Type`

        var body: some View {
            VStack {
                Image(uiImage: type.filledImage)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(type.rawValue)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView(types: .preview())
            .previewLayout(.sizeThatFits)
    }
}
