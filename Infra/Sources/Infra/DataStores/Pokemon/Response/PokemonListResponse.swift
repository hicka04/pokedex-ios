//
//  PokemonListResponse.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import Entity

struct PokemonListResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [PokemonListElement]
}
