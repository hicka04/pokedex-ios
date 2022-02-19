//
//  Pokemon.BaseStats+bulbasaur.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/05.
//

import Foundation
import Entity

extension Pokemon.BaseStats {
    public static var bulbasaur: Self {
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
