//
//  PokemonRequest.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

protocol PokemonRequest: Request {}

extension PokemonRequest {
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/")!
    }
}
