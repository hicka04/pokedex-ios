//
//  TypesView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import SwiftUI
import Entity
import DesignSystem

public struct TypesView: View {
    let types: Pokemon.Types
    let axis: Axis

    public init(types: Pokemon.Types, axis: Axis) {
        self.types = types
        self.axis = axis
    }

    public var body: some View {
        switch axis {
        case .horizontal:
            HStack(spacing: .medium) {
                content()
            }
        case .vertical:
            VStack(spacing: .small) {
                content()
            }.frame(width: 120)
        }
    }

    private func content() -> some View {
        Group {
            TypeView(type: types.first)
            if let secondType = types.second {
                TypeView(type: secondType)
            }
        }
    }
}

private extension TypesView {
    struct TypeView: View {
        let type: Pokemon.`Type`

        private let cornerRadius: CGFloat = 16
        private var height: CGFloat { cornerRadius * 2 }

        var body: some View {
            HStack {
                type.filledImage
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text(type.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(type.color)
                Spacer()
            }
            .frame(height: height)
            .padding(.trailing, cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(type.color, lineWidth: 2, antialiased: true)
            }
        }
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(types: .bulbasaur, axis: .horizontal)
            .previewLayout(.sizeThatFits)

        TypesView(types: .bulbasaur, axis: .vertical)
            .previewLayout(.sizeThatFits)

        TypesView(types: .init(first: .grass, second: nil), axis: .horizontal)
            .previewLayout(.sizeThatFits)
    }
}

// swiftlint:disable type_name
// sourcery:inline:Pokemon.`Type`.TemplateName
struct TypeView_normal_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .normal)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fighting_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .fighting)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_flying_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .flying)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_poison_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .poison)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ground_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .ground)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_rock_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .rock)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_bug_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .bug)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ghost_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .ghost)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_steel_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .steel)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fire_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .fire)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_water_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .water)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_grass_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .grass)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_electric_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .electric)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_psychic_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .psychic)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_ice_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .ice)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_dragon_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .dragon)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_dark_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .dark)
            .previewLayout(.sizeThatFits)
    }
}
struct TypeView_fairy_Preview: PreviewProvider {
    static var previews: some View {
        TypesView.TypeView(type: .fairy)
            .previewLayout(.sizeThatFits)
    }
}
// sourcery:end
// swiftlint:enable type_name
