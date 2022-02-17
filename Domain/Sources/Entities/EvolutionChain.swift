//
//  EvolutionChain.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation

public struct EvolutionChain: Sendable {
    public let id: ID
    public let chain: ChainLink

    public init(id: ID, chain: ChainLink) {
        self.id = id
        self.chain = chain
    }
}

extension EvolutionChain {
    public struct ID: RawRepresentable, Sendable {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    public final class ChainLink: Sendable {
        public let pokemon: Pokemon
        public let isOrigin: Bool
        public let evolvesTo: [ChainLink]

        public init(pokemon: Pokemon, isOrigin: Bool, evolvesTo: [ChainLink]) {
            self.pokemon = pokemon
            self.isOrigin = isOrigin
            self.evolvesTo = evolvesTo
        }
    }
}
