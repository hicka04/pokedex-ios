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

// sourcery:inline:Pokemon.`Type`.TemplateName
struct TypeView_normal_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .normal)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fighting_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .fighting)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_flying_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .flying)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_poison_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .poison)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ground_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .ground)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_rock_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .rock)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_bug_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .bug)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ghost_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .ghost)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_steel_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .steel)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fire_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .fire)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_water_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .water)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_grass_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .grass)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_electric_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .electric)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_psychic_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .psychic)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ice_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .ice)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_dragon_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .dragon)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_dark_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .dark)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fairy_Preview: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.TypesView.TypeView(type: .fairy)
            .previewLayout(.sizeThatFits)
    }
}
// sourcery:end
