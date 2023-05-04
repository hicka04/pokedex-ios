//
//  GetPokemonListStreamInteractor.swift
//  
//
//  Created by hicka04 on 2023/05/04.
//

import Foundation
import Entity
import RepositoryContainer

public protocol GetPokemonListStreamUseCase {
    func callAsFunction() -> AsyncThrowingStream<[Pokemon], Error>
}

public class GetPokemonListStreamInteractor {
    private var offset: Int? = 0

    @Dependency(\.pokemonRepository) private var pokemonRepository

    public init() {}
}

extension GetPokemonListStreamInteractor: GetPokemonListStreamUseCase {
    public func callAsFunction() -> AsyncThrowingStream<[Pokemon], Error> {
        AsyncThrowingStream { [weak self] in
            guard
                let self,
                let offset = self.offset
            else {
                return nil
            }

            let pokemonNameList = try await self.pokemonRepository.getPokemonList(offset: offset)
            let pokemonList = try await withThrowingTaskGroup(of: Pokemon.self) { taskGroup in
                pokemonNameList.names.forEach { name in
                    taskGroup.addTask {
                        try await self.pokemonRepository.getPokemon(name: name)
                    }
                }

                return try await taskGroup
                    .reduce(into: [Pokemon]()) { pokemonList, result in
                        pokemonList.append(result)
                    }.sorted { $0.id.rawValue < $1.id.rawValue }
            }
            self.offset = pokemonNameList.nextOffset
            return pokemonList
        }
    }
}
