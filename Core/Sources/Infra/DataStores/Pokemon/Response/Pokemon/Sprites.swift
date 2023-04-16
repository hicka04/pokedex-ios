//
//  Sprites.swift
//  
//
//  Created by hicka04 on 2022/01/11.
//

import Foundation
import Entity

extension PokemonResponse {
    struct Sprites: Decodable, TranslatableToEntity {
        let other: Other

        func translate() -> Pokemon.Sprites {
            .init(
                officialArtwork: other.officialArtwork.frontDefault
            )
        }
    }
}

extension PokemonResponse.Sprites {
    struct Other: Decodable {
        let officialArtwork: OfficialArtwork

        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
}

extension PokemonResponse.Sprites.Other {
    struct OfficialArtwork: Decodable {
        let frontDefault: URL
    }
}
