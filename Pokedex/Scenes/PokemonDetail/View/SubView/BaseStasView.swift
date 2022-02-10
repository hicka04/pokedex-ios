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

                GeometryReader { proxy in
                    RaderChart(baseStats: baseStats)
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.width
                        )
                }.scaledToFit()
            }
        }
    }
}

private extension PokemonDetailView.BaseStasView {
    struct RaderChart: View {
        let baseStats: Pokemon.BaseStats

        var body: some View {
            ZStack {
                AxisShape()
                    .stroke(Color(uiColor: Asset.Colors.BaseStats.axis.color))
                ValuesShape(baseStats: baseStats)
                    .stroke(
                        Color(uiColor: Asset.Colors.BaseStats.value.color),
                        lineWidth: 4
                    )
            }
        }
    }
}

private extension PokemonDetailView.BaseStasView.RaderChart {
    struct ValuesShape: Shape {
        let baseStats: Pokemon.BaseStats

        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: baseStats.point(category: .hp, rect: rect))
                path.addLine(to: baseStats.point(category: .attack, rect: rect))
                path.addLine(to: baseStats.point(category: .defense, rect: rect))
                path.addLine(to: baseStats.point(category: .speed, rect: rect))
                path.addLine(to: baseStats.point(category: .specialDefense, rect: rect))
                path.addLine(to: baseStats.point(category: .specialAttack, rect: rect))
                path.closeSubpath()
            }
        }
    }

    struct AxisShape: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: Pokemon.BaseStats.axisMaxPoint(category: .hp, rect: rect))
                path.addLine(to: Pokemon.BaseStats.axisMaxPoint(category: .speed, rect: rect))

                path.move(to: Pokemon.BaseStats.axisMaxPoint(category: .attack, rect: rect))
                path.addLine(to: Pokemon.BaseStats.axisMaxPoint(category: .specialDefense, rect: rect))

                path.move(to: Pokemon.BaseStats.axisMaxPoint(category: .defense, rect: rect))
                path.addLine(to: Pokemon.BaseStats.axisMaxPoint(category: .specialAttack, rect: rect))
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

private extension Pokemon.BaseStats.Category {
    var theta: Double {
        switch self {
        case .hp: return Double.pi * 3 / 2
        case .attack: return Double.pi * 11 / 6
        case .defense: return Double.pi / 6
        case .specialAttack: return Double.pi * 7 / 6
        case .specialDefense: return Double.pi * 5 / 6
        case .speed: return Double.pi / 2
        }
    }
}

private extension Pokemon.BaseStats {
    private func coordinate(category: Category) -> CGPoint {
        .init(
            x: cos(category.theta) * Double(self[category]),
            y: sin(category.theta) * Double(self[category])
        )
    }

    func point(category: Category, rect: CGRect) -> CGPoint {
        let coordinate = coordinate(category: category)
        return .init(
            x: coordinate.x * rect.width / 2 / 255 + rect.midX,
            y: coordinate.y * rect.height / 2 / 255 + rect.midY
        )
    }

    static func axisMaxPoint(category: Category, rect: CGRect) -> CGPoint {
        .init(
            x: CGFloat(cos(category.theta)) * rect.width / 2 + rect.midX,
            y: CGFloat(sin(category.theta)) * rect.height / 2 + rect.midY
        )
    }
}
