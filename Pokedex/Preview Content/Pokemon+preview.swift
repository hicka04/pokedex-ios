//
//  Pokemon+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/26.
//

import Foundation
import Entity

extension Pokemon {
    static func preview() -> Self {
        .init(
            id: .init(rawValue: 1),
            name: "フシギダネ",
            height: 0.7,
            weight: 6.9,
            types: .preview(),
            abilities: .init(
                first: .init(name: "overgrow"),
                second: nil,
                hidden: .init(name: "chlorophyll")
            ),
            sprites: .init(
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
        )
    }
}
