//
//  PokemonRepository.swift
//  
//
//  Created by hicka04 on 2022/01/03.
//

import Foundation
import Entity

public protocol PokemonRepository {
    func getPokemonList(offset: Int) async throws -> PokemonListPage
    func getPokemon(name: String) async throws -> Pokemon
    func getPokemonSpecies(pokemonId: Pokemon.ID) async throws -> PokemonSpecies
    func getEvolutionChain(id: EvolutionChain.ID) async throws -> EvolutionChain
}
