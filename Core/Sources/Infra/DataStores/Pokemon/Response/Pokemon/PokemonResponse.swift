//
//  PokemonResponse.swift
//  
//
//  Created by hicka04 on 2022/01/07.
//

import Foundation
import Entity

struct PokemonResponse: Decodable, TranslatableToEntity {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [`Type`]
    let abilities: [Ability]
    let stats: [BaseStat]
    let sprites: Sprites

    func translate() -> Pokemon {
        .init(
            id: .init(rawValue: id),
            name: .init(rawValue: name),
            height: Double(height) / 10,
            weight: Double(weight) / 10,
            types: types.translate(),
            abilities: abilities.translate(),
            baseStats: stats.translate(),
            sprites: sprites.translate()
        )
    }
}

extension Array: TranslatableToEntity {
    func translate() throws -> Never {
        fatalError()
    }
}
