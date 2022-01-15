//
//  Sprites.swift
//  
//
//  Created by hicka04 on 2022/01/11.
//

import Foundation
import Entity

extension PokemonResponse {
    struct Sprites: Decodable {
        let frontDefault: URL
        let frontShiny: URL
        let frontFemale: URL?
        let frontShinyFemale: URL?
        let backDefault: URL
        let backShiny: URL
        let backFemale: URL?
        let backShinyFemale: URL?
        let other: Other

        func translate() -> Pokemon.Sprites {
            .init(
                default: .init(front: frontDefault, back: backDefault),
                female: .init(front: frontFemale, back: backFemale),
                shiny: .init(front: frontShiny, back: backShiny),
                shinyFemale: .init(front: frontShinyFemale, back: backShinyFemale),
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
