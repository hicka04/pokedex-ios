//
//  Pokemon.BaseStats+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/05.
//

import Foundation
import Entity

extension Pokemon.BaseStats {
    static func preview() -> Self {
        .init(
            hp: 45,
            attack: 49,
            defense: 49,
            specialAttack: 65,
            specialDefense: 65,
            speed: 45
        )
    }
}
