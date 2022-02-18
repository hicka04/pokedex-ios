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
        case .normal: return Asset.Images.Types.Normal.outline.image
        case .fighting: return Asset.Images.Types.Fighting.outline.image
        case .flying: return Asset.Images.Types.Flying.outline.image
        case .poison: return Asset.Images.Types.Poison.outline.image
        case .ground: return Asset.Images.Types.Ground.outline.image
        case .rock: return Asset.Images.Types.Rock.outline.image
        case .bug: return Asset.Images.Types.Bug.outline.image
        case .ghost: return Asset.Images.Types.Ghost.outline.image
        case .steel: return Asset.Images.Types.Steel.outline.image
        case .fire: return Asset.Images.Types.Fire.outline.image
        case .water: return Asset.Images.Types.Water.outline.image
        case .grass: return Asset.Images.Types.Grass.outline.image
        case .electric: return Asset.Images.Types.Electric.outline.image
        case .psychic: return Asset.Images.Types.Psychic.outline.image
        case .ice: return Asset.Images.Types.Ice.outline.image
        case .dragon: return Asset.Images.Types.Dragon.outline.image
        case .dark: return Asset.Images.Types.Dark.outline.image
        case .fairy: return Asset.Images.Types.Fairy.outline.image
        }
    }

    var filledImage: UIImage {
        switch self {
        case .normal: return Asset.Images.Types.Normal.fill.image
        case .fighting: return Asset.Images.Types.Fighting.fill.image
        case .flying: return Asset.Images.Types.Flying.fill.image
        case .poison: return Asset.Images.Types.Poison.fill.image
        case .ground: return Asset.Images.Types.Ground.fill.image
        case .rock: return Asset.Images.Types.Rock.fill.image
        case .bug: return Asset.Images.Types.Bug.fill.image
        case .ghost: return Asset.Images.Types.Ghost.fill.image
        case .steel: return Asset.Images.Types.Steel.fill.image
        case .fire: return Asset.Images.Types.Fire.fill.image
        case .water: return Asset.Images.Types.Water.fill.image
        case .grass: return Asset.Images.Types.Grass.fill.image
        case .electric: return Asset.Images.Types.Electric.fill.image
        case .psychic: return Asset.Images.Types.Psychic.fill.image
        case .ice: return Asset.Images.Types.Ice.fill.image
        case .dragon: return Asset.Images.Types.Dragon.fill.image
        case .dark: return Asset.Images.Types.Dark.fill.image
        case .fairy: return Asset.Images.Types.Fairy.fill.image
        }
    }
}
