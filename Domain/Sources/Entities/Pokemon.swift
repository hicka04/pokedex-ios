//
//  Pokemon.swift
//  
//
//  Created by hicka04 on 2022/01/07.
//

import Foundation

public struct Pokemon: Decodable, Identifiable {
    public let id: ID
    public let name: String
    public let height: Int
    public let weight: Int

    public init(id: ID, name: String, height: Int, weight: Int) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
    }
}

public extension Pokemon {
    struct ID: RawRepresentable, Decodable, Hashable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
