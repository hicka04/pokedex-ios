//
//  BaseStasView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/05.
//

import SwiftUI
import Entity
import DesignSystem
import Core

struct BaseStasView: View {
    let baseStats: Pokemon.BaseStats

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text("Base Stats")
                .font(.headline)

            GeometryReader { proxy in
                RadarChart(baseStats: baseStats)
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.width
                    )
            }.scaledToFit()
        }
    }
}

private extension BaseStasView {
    struct RadarChart: View {
        let baseStats: Pokemon.BaseStats

        var body: some View {
            ZStack {
                AxisLabelsView()
                ZStack {
                    AxisShape()
                        .stroke(Color(uiColor: Asset.BaseStats.axis.color))
                    ValuesShape(baseStats: baseStats)
                        .stroke(
                            Color(uiColor: Asset.BaseStats.value.color),
                            lineWidth: 4
                        )
                }.padding(.xLarge)
            }
        }
    }
}

private extension BaseStasView.RadarChart {
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

    struct AxisLabelsView: View {
        var body: some View {
            AxisLabelView(category: .hp)
            AxisLabelView(category: .attack)
            AxisLabelView(category: .defense)
            AxisLabelView(category: .specialAttack)
            AxisLabelView(category: .specialDefense)
            AxisLabelView(category: .speed)
        }

        private struct AxisLabelView: View {
            let category: Pokemon.BaseStats.Category

            var body: some View {
                GeometryReader { proxy in
                    Text(category.label)
                        .font(.caption2)
                        .foregroundColor(Color(uiColor: Asset.BaseStats.label.color))
                        .position(category.labelPosition(size: proxy.size))
                }
            }
        }
    }
}

struct BaseStasView_Previews: PreviewProvider {
    static var previews: some View {
        BaseStasView(baseStats: .bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}

private extension Pokemon.BaseStats.Category {
    var theta: CGFloat {
        switch self {
        case .hp: return .pi * 3 / 2
        case .attack: return .pi * 11 / 6
        case .defense: return .pi / 6
        case .specialAttack: return .pi * 7 / 6
        case .specialDefense: return .pi * 5 / 6
        case .speed: return .pi / 2
        }
    }

    var label: String {
        switch self {
        case .hp: return "HP"
        case .attack: return "Attack"
        case .defense: return "Defense"
        case .specialAttack: return "SpecialAttack"
        case .specialDefense: return "SpecialDefense"
        case .speed: return "Speed"
        }
    }

    func labelPosition(size: CGSize) -> CGPoint {
        .init(
            x: cos(theta) * (size.width / 2 - 24) + size.width / 2,
            y: sin(theta) * (size.height / 2 - 24) + size.height / 2
        )
    }
}

private extension Pokemon.BaseStats {
    private func coordinate(category: Category) -> CGPoint {
        .init(
            x: cos(category.theta) * CGFloat(self[category]),
            y: sin(category.theta) * CGFloat(self[category])
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
            x: cos(category.theta) * rect.width / 2 + rect.midX,
            y: sin(category.theta) * rect.height / 2 + rect.midY
        )
    }
}
