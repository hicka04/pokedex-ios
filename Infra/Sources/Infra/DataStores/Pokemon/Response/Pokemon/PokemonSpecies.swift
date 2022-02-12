//
//  PokemonSpecies.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation
import Entity

struct PokemonSpecies: Decodable {
    let id: Int
    let evolutionChain: EvolutionChainResource

    struct EvolutionChainResource: Decodable {
        let url: URL
    }
}

extension PokemonSpecies: TranslatableToEntity {
    func translate() throws -> Entity.PokemonSpecies {
        let evolutionChainId = Int(evolutionChain.url.pathComponents.last!)!
        return .init(
            id: .init(rawValue: id),
            evolutionChainId: evolutionChainId
        )
    }
}
