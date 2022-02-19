//
//  EvolutionChain+preview.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity

extension EvolutionChain {
    public static func preview() -> Self {
        .init(
            id: .init(rawValue: 1),
            chain: .preview()
        )
    }
}

extension EvolutionChain.ChainLink {
    public static func preview() -> Self {
        .init(
            pokemon: .preview(),
            isOrigin: true,
            evolvesTo: [
                .init(pokemon: .preview(), isOrigin: false, evolvesTo: [
                    .init(pokemon: .preview(), isOrigin: false, evolvesTo: []),
                    .init(pokemon: .preview(), isOrigin: false, evolvesTo: [])
                ]),
                .init(pokemon: .preview(), isOrigin: false, evolvesTo: [
                    .init(pokemon: .preview(), isOrigin: false, evolvesTo: []),
                    .init(pokemon: .preview(), isOrigin: false, evolvesTo: [])
                ])
            ]
        )
    }
}
