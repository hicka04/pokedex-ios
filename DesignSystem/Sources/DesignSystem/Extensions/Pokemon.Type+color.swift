//
//  Pokemon.Type+color.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/28.
//

import SwiftUI
import Entity

public extension Pokemon.`Type` {
    var color: Color {
        switch self {
        case .normal: return Asset.Types.Normal.tint.swiftUIColor
        case .fighting: return Asset.Types.Fighting.tint.swiftUIColor
        case .flying: return Asset.Types.Flying.tint.swiftUIColor
        case .poison: return Asset.Types.Poison.tint.swiftUIColor
        case .ground: return Asset.Types.Ground.tint.swiftUIColor
        case .rock: return Asset.Types.Rock.tint.swiftUIColor
        case .bug: return Asset.Types.Bug.tint.swiftUIColor
        case .ghost: return Asset.Types.Ghost.tint.swiftUIColor
        case .steel: return Asset.Types.Steel.tint.swiftUIColor
        case .fire: return Asset.Types.Fire.tint.swiftUIColor
        case .water: return Asset.Types.Water.tint.swiftUIColor
        case .grass: return Asset.Types.Grass.tint.swiftUIColor
        case .electric: return Asset.Types.Electric.tint.swiftUIColor
        case .psychic: return Asset.Types.Psychic.tint.swiftUIColor
        case .ice: return Asset.Types.Ice.tint.swiftUIColor
        case .dragon: return Asset.Types.Dragon.tint.swiftUIColor
        case .dark: return Asset.Types.Dark.tint.swiftUIColor
        case .fairy: return Asset.Types.Fairy.tint.swiftUIColor
        }
    }
}
