//
//  Pokemon.Type+color.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/28.
//

import UIKit
import Entity
import DesignSystem

extension Pokemon.`Type` {
    var color: UIColor {
        switch self {
        case .normal: return Asset.Types.Normal.tint.color
        case .fighting: return Asset.Types.Fighting.tint.color
        case .flying: return Asset.Types.Flying.tint.color
        case .poison: return Asset.Types.Poison.tint.color
        case .ground: return Asset.Types.Ground.tint.color
        case .rock: return Asset.Types.Rock.tint.color
        case .bug: return Asset.Types.Bug.tint.color
        case .ghost: return Asset.Types.Ghost.tint.color
        case .steel: return Asset.Types.Steel.tint.color
        case .fire: return Asset.Types.Fire.tint.color
        case .water: return Asset.Types.Water.tint.color
        case .grass: return Asset.Types.Grass.tint.color
        case .electric: return Asset.Types.Electric.tint.color
        case .psychic: return Asset.Types.Psychic.tint.color
        case .ice: return Asset.Types.Ice.tint.color
        case .dragon: return Asset.Types.Dragon.tint.color
        case .dark: return Asset.Types.Dark.tint.color
        case .fairy: return Asset.Types.Fairy.tint.color
        }
    }
}
