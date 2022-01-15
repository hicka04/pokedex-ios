//
//  Pokemon.swift
//  
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

public struct Pokemon: Equatable, Identifiable, Sendable {
    public let id: ID
    public let name: String
    public let height: Double
    public let weight: Double
    public let sprites: Sprites

    public init(
        id: ID,
        name: String,
        height: Double,
        weight: Double,
        sprites: Sprites
    ) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.sprites = sprites
    }
}

public extension Pokemon {
    struct ID: RawRepresentable, Hashable, Sendable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
