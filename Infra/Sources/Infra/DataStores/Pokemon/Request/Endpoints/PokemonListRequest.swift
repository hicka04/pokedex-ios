//
//  PokemonListRequest.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

struct PokemonListRequest: PokemonRequest {
    typealias Response = PokemonListResponse

    let path = "pokemon"
    let method: HTTPMethod = .get
}