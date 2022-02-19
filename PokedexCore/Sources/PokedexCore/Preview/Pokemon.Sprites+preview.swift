//
//  Pokemon.Sprites+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/03.
//

import Foundation
import Entity

extension Pokemon.Sprites {
    public static func preview() -> Self {
        .init(
            officialArtwork: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
        )
    }
}
