//
//  Pokemon.Sprites+bulbasaur.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/03.
//

import Foundation
import Entity

extension Pokemon.Sprites {
    public static var bulbasaur: Self {
        .init(
            officialArtwork: .init(
                // swiftlint:disable:next line_length
                string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
            )!
        )
    }
}
