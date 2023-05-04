//
//  Pokemon+bulbasaur.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import Foundation
import Entity

extension Pokemon {
    public static var bulbasaur: Self {
        .init(
            id: 1,
            name: "bulbasaur",
            height: 0.7,
            weight: 6.9,
            types: .bulbasaur,
            abilities: .bulbasaur,
            baseStats: .bulbasaur,
            sprites: .bulbasaur
        )
    }
}
