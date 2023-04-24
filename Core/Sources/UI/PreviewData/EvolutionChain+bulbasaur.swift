//
//  EvolutionChain+bulbasaur.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity

extension EvolutionChain {
    public static var bulbasaur: Self {
        .init(
            id: .init(rawValue: 1),
            chain: .bulbasaur
        )
    }
}

extension EvolutionChain.ChainLink {
    public static var bulbasaur: Self {
        .init(
            pokemon: .bulbasaur,
            isOrigin: true,
            evolvesTo: [
                .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: [
                    .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: []),
                    .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: [])
                ]),
                .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: [
                    .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: []),
                    .init(pokemon: .bulbasaur, isOrigin: false, evolvesTo: [])
                ])
            ]
        )
    }
}
