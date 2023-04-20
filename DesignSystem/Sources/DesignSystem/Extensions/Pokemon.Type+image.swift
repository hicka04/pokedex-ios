//
//  Pokemon.Type+image.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/19.
//

import SwiftUI
import Entity

public extension Pokemon.`Type` {
    var outlinedImage: Image {
        switch self {
        case .normal: return Asset.Types.Normal.outline.swiftUIImage
        case .fighting: return Asset.Types.Fighting.outline.swiftUIImage
        case .flying: return Asset.Types.Flying.outline.swiftUIImage
        case .poison: return Asset.Types.Poison.outline.swiftUIImage
        case .ground: return Asset.Types.Ground.outline.swiftUIImage
        case .rock: return Asset.Types.Rock.outline.swiftUIImage
        case .bug: return Asset.Types.Bug.outline.swiftUIImage
        case .ghost: return Asset.Types.Ghost.outline.swiftUIImage
        case .steel: return Asset.Types.Steel.outline.swiftUIImage
        case .fire: return Asset.Types.Fire.outline.swiftUIImage
        case .water: return Asset.Types.Water.outline.swiftUIImage
        case .grass: return Asset.Types.Grass.outline.swiftUIImage
        case .electric: return Asset.Types.Electric.outline.swiftUIImage
        case .psychic: return Asset.Types.Psychic.outline.swiftUIImage
        case .ice: return Asset.Types.Ice.outline.swiftUIImage
        case .dragon: return Asset.Types.Dragon.outline.swiftUIImage
        case .dark: return Asset.Types.Dark.outline.swiftUIImage
        case .fairy: return Asset.Types.Fairy.outline.swiftUIImage
        }
    }

    var filledImage: Image {
        switch self {
        case .normal: return Asset.Types.Normal.fill.swiftUIImage
        case .fighting: return Asset.Types.Fighting.fill.swiftUIImage
        case .flying: return Asset.Types.Flying.fill.swiftUIImage
        case .poison: return Asset.Types.Poison.fill.swiftUIImage
        case .ground: return Asset.Types.Ground.fill.swiftUIImage
        case .rock: return Asset.Types.Rock.fill.swiftUIImage
        case .bug: return Asset.Types.Bug.fill.swiftUIImage
        case .ghost: return Asset.Types.Ghost.fill.swiftUIImage
        case .steel: return Asset.Types.Steel.fill.swiftUIImage
        case .fire: return Asset.Types.Fire.fill.swiftUIImage
        case .water: return Asset.Types.Water.fill.swiftUIImage
        case .grass: return Asset.Types.Grass.fill.swiftUIImage
        case .electric: return Asset.Types.Electric.fill.swiftUIImage
        case .psychic: return Asset.Types.Psychic.fill.swiftUIImage
        case .ice: return Asset.Types.Ice.fill.swiftUIImage
        case .dragon: return Asset.Types.Dragon.fill.swiftUIImage
        case .dark: return Asset.Types.Dark.fill.swiftUIImage
        case .fairy: return Asset.Types.Fairy.fill.swiftUIImage
        }
    }
}
