//
//  GetEvolutionChainRequest.swift
//  
//
//  Created by hicka04 on 2022/02/14.
//

import Foundation
import APIKit
import Entity

struct GetEvolutionChainRequest: PokemonRequest {
    typealias Response = EvolutionChainResponse

    var path: String {
        "evolution-chain/\(evolutionChainId.rawValue)"
    }
    let method: HTTPMethod = .get
    let evolutionChainId: EvolutionChain.ID
}
