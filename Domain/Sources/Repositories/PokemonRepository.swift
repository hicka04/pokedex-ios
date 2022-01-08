//
//  PokemonRepository.swift
//  
//
//  Created by hicka04 on 2022/01/03.
//

import Foundation
import Entity

public protocol PokemonRepository {
    func getPokemonList() async throws -> [Pokemon]
    func getPokemon(name: String) async throws -> Pokemon
}
