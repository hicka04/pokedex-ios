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

public struct PokemonDataStore {
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
    public func getPokemonList() async throws -> [PokemonListElement] {
        let response = try await session.send(PokemonListRequest())
        return response.results
    }
}
