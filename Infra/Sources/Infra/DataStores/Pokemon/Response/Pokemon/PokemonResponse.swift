//
//  PokemonResponse.swift
//  
//
//  Created by hicka04 on 2022/01/07.
//

import Foundation
import Entity

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites

    func translate() -> Pokemon {
        .init(
            id: .init(rawValue: id),
            name: name,
            height: Double(height) / 10,
            weight: Double(weight) / 10,
            sprites: sprites.translate()
        )
    }
}
