//
//  EvolutionChainResponse.swift
//  
//
//  Created by hicka04 on 2022/02/13.
//

import Foundation
import Entity

struct EvolutionChainResponse: Decodable {
    let id: Int
    let chain: ChainLink
}

extension EvolutionChainResponse {
    final class ChainLink: Decodable {
        let species: Species
        let evolvesTo: [ChainLink]
    }
}

extension EvolutionChainResponse.ChainLink {
    typealias Species = NamedResponse
}
