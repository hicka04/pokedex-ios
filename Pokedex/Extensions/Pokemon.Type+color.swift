//
//  Pokemon.Type+color.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/28.
//

import UIKit
import Entity

extension Pokemon.`Type` {
    var color: UIColor {
        switch self {
        case .normal: return Asset.Colors.Types.normal.color
        case .fighting: return Asset.Colors.Types.fighting.color
        case .flying: return Asset.Colors.Types.flying.color
        case .poison: return Asset.Colors.Types.poison.color
        case .ground: return Asset.Colors.Types.ground.color
        case .rock: return Asset.Colors.Types.rock.color
        case .bug: return Asset.Colors.Types.bug.color
        case .ghost: return Asset.Colors.Types.ghost.color
        case .steel: return Asset.Colors.Types.steel.color
        case .fire: return Asset.Colors.Types.fire.color
        case .water: return Asset.Colors.Types.water.color
        case .grass: return Asset.Colors.Types.grass.color
        case .electric: return Asset.Colors.Types.electric.color
        case .psychic: return Asset.Colors.Types.psychic.color
        case .ice: return Asset.Colors.Types.ice.color
        case .dragon: return Asset.Colors.Types.dragon.color
        case .dark: return Asset.Colors.Types.dark.color
        case .fairy: return Asset.Colors.Types.fairy.color
        }
    }
}
