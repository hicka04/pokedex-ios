//
//  Pokemon+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import Foundation
import Entity

extension Pokemon {
    public static func preview() -> Self {
        .init(
            id: .init(rawValue: 1),
            name: "フシギダネ",
            height: 0.7,
            weight: 6.9,
            types: .preview(),
            abilities: .preview(),
            baseStats: .preview(),
            sprites: .preview()
        )
    }
}
