//
//  Pokemon.Type+image.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/19.
//

import UIKit
import Entity
import DesignSystem

extension Pokemon.`Type` {
    var outlinedImage: UIImage {
        switch self {
        case .normal: return Asset.Types.Normal.outline.image
        case .fighting: return Asset.Types.Fighting.outline.image
        case .flying: return Asset.Types.Flying.outline.image
        case .poison: return Asset.Types.Poison.outline.image
        case .ground: return Asset.Types.Ground.outline.image
        case .rock: return Asset.Types.Rock.outline.image
        case .bug: return Asset.Types.Bug.outline.image
        case .ghost: return Asset.Types.Ghost.outline.image
        case .steel: return Asset.Types.Steel.outline.image
        case .fire: return Asset.Types.Fire.outline.image
        case .water: return Asset.Types.Water.outline.image
        case .grass: return Asset.Types.Grass.outline.image
        case .electric: return Asset.Types.Electric.outline.image
        case .psychic: return Asset.Types.Psychic.outline.image
        case .ice: return Asset.Types.Ice.outline.image
        case .dragon: return Asset.Types.Dragon.outline.image
        case .dark: return Asset.Types.Dark.outline.image
        case .fairy: return Asset.Types.Fairy.outline.image
        }
    }

    var filledImage: UIImage {
        switch self {
        case .normal: return Asset.Types.Normal.fill.image
        case .fighting: return Asset.Types.Fighting.fill.image
        case .flying: return Asset.Types.Flying.fill.image
        case .poison: return Asset.Types.Poison.fill.image
        case .ground: return Asset.Types.Ground.fill.image
        case .rock: return Asset.Types.Rock.fill.image
        case .bug: return Asset.Types.Bug.fill.image
        case .ghost: return Asset.Types.Ghost.fill.image
        case .steel: return Asset.Types.Steel.fill.image
        case .fire: return Asset.Types.Fire.fill.image
        case .water: return Asset.Types.Water.fill.image
        case .grass: return Asset.Types.Grass.fill.image
        case .electric: return Asset.Types.Electric.fill.image
        case .psychic: return Asset.Types.Psychic.fill.image
        case .ice: return Asset.Types.Ice.fill.image
        case .dragon: return Asset.Types.Dragon.fill.image
        case .dark: return Asset.Types.Dark.fill.image
        case .fairy: return Asset.Types.Fairy.fill.image
        }
    }
}
