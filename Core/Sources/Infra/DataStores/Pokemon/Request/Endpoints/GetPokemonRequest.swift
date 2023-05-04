//
//  GetPokemonRequest.swift
//  
//
//  Created by hicka04 on 2022/01/07.
//

import Foundation
import Entity
import APIKit

struct GetPokemonRequest: PokemonRequest {
    typealias Response = PokemonResponse

    var path: String {
        "pokemon/\(name.rawValue)"
    }
    let method: HTTPMethod = .get
    let name: Pokemon.Name
}
