//
//  PokemonSpeciesResponse.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation
import Entity

struct PokemonSpeciesResponse: Decodable {
    let id: Int
    let evolutionChain: EvolutionChainResource

    struct EvolutionChainResource: Decodable {
        let url: URL
    }
}

extension PokemonSpeciesResponse: TranslatableToEntity {
    func translate() throws -> PokemonSpecies {
        let evolutionChainId = Int(evolutionChain.url.pathComponents.last!)!
        return .init(
            id: .init(rawValue: id),
            evolutionChainId: .init(rawValue: evolutionChainId)
        )
    }
}
