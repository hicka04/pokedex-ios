//
//  Pokemon.Sprites+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/03.
//

import Foundation
import Entity

extension Pokemon.Sprites {
    static func preview() -> Self {
        .init(
            default: .init(
                front: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
                back: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png")
            )!,
            female: nil,
            shiny: .init(
                front: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"),
                back: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png")
            )!,
            shinyFemale: nil,
            officialArtwork: .init(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
        )
    }
}
