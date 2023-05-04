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

extension PokemonListResponse {
    var nextOffset: Int? {
        guard
            let nextUrl = next,
            let urlComponents = URLComponents(url: nextUrl, resolvingAgainstBaseURL: true),
            let offsetString = urlComponents.queryItems?.first(where: { $0.name == "offset" })?.value,
            let offset = Int(offsetString)
        else {
            return nil
        }

        return offset
    }
}

extension PokemonListResponse: TranslatableToEntity {
    func translate() throws -> PokemonListPage {
        .init(
            nextOffset: nextOffset,
            names: results.map { .init(rawValue: $0.name) }
        )
    }
}
