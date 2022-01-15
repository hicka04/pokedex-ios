//
//  GetPokemonListRequest.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

struct GetPokemonListRequest: PaginablePokemonRequest {
    typealias Response = PokemonListResponse

    let path = "pokemon"
    let method: HTTPMethod = .get
    let limit = 20
    let offset: Int?
    var queryParameters: [String : Any]? {
        [
            "limit": limit,
            "offset": offset ?? 0
        ]
    }
}
