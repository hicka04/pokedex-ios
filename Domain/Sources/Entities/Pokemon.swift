//
//  Pokemon.swift
//  
//
//  Created by hicka04 on 2022/01/07.
//

import Foundation

public struct Pokemon: Decodable {
    let id: ID
    let name: String
    let height: Int
    let weight: Int
}

public extension Pokemon {
    struct ID: RawRepresentable, Decodable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
