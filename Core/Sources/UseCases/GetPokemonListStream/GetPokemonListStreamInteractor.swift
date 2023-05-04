//
//  GetPokemonListStreamInteractor.swift
//  
//
//  Created by hicka04 on 2023/05/04.
//

import Foundation
import Entity
import RepositoryContainer

public protocol GetPokemonListStreamUseCase: UseCase
where Input == Void, Output == AsyncThrowingStream<[Pokemon], Error> {}

public class GetPokemonListStreamInteractor {
    private var offset: Int? = 0

    @Dependency(\.pokemonRepository) private var pokemonRepository

    public init() {}
}

extension GetPokemonListStreamInteractor: GetPokemonListStreamUseCase {
    public func execute(_ input: Void) -> AsyncThrowingStream<[Pokemon], Error> {
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
//    public func execute(_ input: Void) async throws -> AsyncThrowingChannel<[Pokemon], Error> {
//        try await loadNextPage()
//
//        return channel
//    }
//
//    public func loadNextPage() async throws {
//        guard let offset else {
//            channel.finish()
//            return
//        }
//
//        do {
//            let pokemonNameList = try await pokemonRepository.getPokemonList(offset: offset)
//            let pokemonList = try await withThrowingTaskGroup(of: Pokemon.self) { [pokemonRepository] taskGroup in
//                pokemonNameList.names.forEach { name in
//                    taskGroup.addTask {
//                        try await pokemonRepository.getPokemon(name: name)
//                    }
//                }
//
//                return try await taskGroup
//                    .reduce(into: [Pokemon]()) { pokemonList, result in
//                        pokemonList.append(result)
//                    }.sorted { $0.id.rawValue < $1.id.rawValue }
//            }
//            await channel.send(pokemonList)
//            self.offset = pokemonNameList.nextOffset
//        } catch {
//            channel.fail(error)
//        }
//    }
}
