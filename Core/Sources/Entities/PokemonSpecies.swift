//
//  PokemonSpecies.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation

public struct PokemonSpecies {
    public let id: ID
    public let evolutionChainId: EvolutionChain.ID

    public init(id: PokemonSpecies.ID, evolutionChainId: EvolutionChain.ID) {
        self.id = id
        self.evolutionChainId = evolutionChainId
    }
}

extension PokemonSpecies {
    public struct ID: RawRepresentable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
