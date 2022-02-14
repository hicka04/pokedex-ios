//
//  GetPokemonSpeciesRequest.swift
//  
//
//  Created by hicka04 on 2022/02/12.
//

import Foundation
import Entity
import APIKit

struct GetPokemonSpeciesRequest: PokemonRequest {
    typealias Response = PokemonSpeciesResponse

    var path: String {
        "pokemon-species/\(pokemonId.rawValue)"
    }
    let method: HTTPMethod = .get
    let pokemonId: Pokemon.ID
}
