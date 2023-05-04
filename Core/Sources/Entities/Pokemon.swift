//
//  Pokemon.swift
//  
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

public struct Pokemon: Hashable, Identifiable, Sendable {
    public let id: ID
    public let name: Name
    public let height: Double
    public let weight: Double
    public let types: Types
    public let abilities: Abilities
    public let baseStats: BaseStats
    public let sprites: Sprites

    public init(
        id: ID,
        name: Name,
        height: Double,
        weight: Double,
        types: Types,
        abilities: Abilities,
        baseStats: BaseStats,
        sprites: Sprites
    ) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.types = types
        self.abilities = abilities
        self.baseStats = baseStats
        self.sprites = sprites
    }
}

public extension Pokemon {
    struct ID: RawRepresentable, ExpressibleByIntegerLiteral, Hashable, Sendable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public init(integerLiteral value: Int) {
            self.rawValue = value
        }
    }

    struct Name: RawRepresentable, ExpressibleByStringLiteral, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(stringLiteral value: String) {
            self.rawValue = value
        }
    }
}
