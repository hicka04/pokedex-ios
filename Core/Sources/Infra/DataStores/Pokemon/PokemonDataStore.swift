//
//  PokemonDataStore.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit
import Entity
import Repository

public struct PokemonDataStore: Sendable {
    private let session: Session

    init(session: Session) {
        self.session = session
    }

    public init() {
        let adapter = URLSessionAdapter(configuration: .default)
        let session = Session(adapter: adapter, callbackQueue: .sessionQueue)
        self.init(session: session)
    }
}

extension PokemonDataStore: PokemonRepository {
    public func getPokemonList(offset: Int) async throws -> PokemonListPage {
        let response = try await session.send(GetPokemonListRequest(offset: offset))
        let pokemonList: [Pokemon] = try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
            response.results.forEach { pokemonListElement in
                taskGroup.addTask {
                    try await self.getPokemon(name: pokemonListElement.name)
                }
            }

            return try await taskGroup
                .reduce(into: [Pokemon]()) { pokemonList, result in
                    pokemonList.append(result)
                }.sorted { $0.id.rawValue < $1.id.rawValue }
        }
        return PokemonListPage(nextOffset: response.nextOffset, items: pokemonList)
    }

    public func getPokemon(name: String) async throws -> Pokemon {
        try await session.send(GetPokemonRequest(name: name)).translate()
    }

    public func getPokemonSpecies(pokemonId: Pokemon.ID) async throws -> Entity.PokemonSpecies {
        try await session.send(GetPokemonSpeciesRequest(pokemonId: pokemonId)).translate()
    }

    public func getEvolutionChain(id: EvolutionChain.ID) async throws -> EvolutionChain {
        let evolutionChainResponse = try await session.send(GetEvolutionChainRequest(evolutionChainId: id))
        @Sendable func getPokemonRecursive(
            chain: EvolutionChainResponse.ChainLink,
            isOrigin: Bool
        ) async throws -> EvolutionChain.ChainLink {
            async let pokemon = getPokemon(name: chain.species.name)
            async let evolvesTo = withThrowingTaskGroup(of: EvolutionChain.ChainLink.self) { taskGroup in
                chain.evolvesTo.forEach { chain in
                    taskGroup.addTask {
                        try await getPokemonRecursive(chain: chain, isOrigin: false)
                    }
                }

                return try await taskGroup
                    .reduce(into: [EvolutionChain.ChainLink]()) { evolvesTo, result in
                        evolvesTo.append(result)
                    }.sorted { $0.pokemon.id.rawValue < $1.pokemon.id.rawValue }
            }
            return try await .init(pokemon: pokemon, isOrigin: isOrigin, evolvesTo: evolvesTo)
        }
        let chain = try await getPokemonRecursive(chain: evolutionChainResponse.chain, isOrigin: true)
        return .init(id: .init(rawValue: evolutionChainResponse.id), chain: chain)
    }
}
