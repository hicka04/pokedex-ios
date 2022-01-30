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

        private let cornerRadius: CGFloat = 16
        private var height: CGFloat { cornerRadius * 2 }

        var body: some View {
            HStack {
                Image(uiImage: type.filledImage)
                    .resizable()
                    .scaledToFit()
                Text(type.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(uiColor: type.color))
            }
            .frame(height: height)
            .padding(.trailing, cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color(uiColor: type.color), lineWidth: 2)
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
