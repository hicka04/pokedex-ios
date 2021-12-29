//
//  PokemonDataStore.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

struct PokemonDataStore {
    private let session: Session

    init(session: Session) {
        self.session = session
    }

    convenience init() {
        let adapter = URLSessionAdapter(configuration: .default)
        let session = Session(adapter: adapter, callbackQueue: .sessionQueue)
        self.init(session: session)
    }

    func getPokemonList() async throws -> PokemonListResponse {
        session.send(PokemonListRequest())
    }
}
