//
//  PokemonSpecies.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation

public struct PokemonSpecies {
    public let id: ID
    public let evolutionChainId: Int // FIXME

    public init(id: PokemonSpecies.ID, evolutionChainId: Int) {
        self.id = id
        self.evolutionChainId = evolutionChainId
    }
}

extension PokemonSpecies {
    public struct ID: RawRepresentable {
        public var rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
