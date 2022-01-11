//
//  Sprites.swift
//  
//
//  Created by hicka04 on 2022/01/11.
//

import Foundation

extension Pokemon {
    public struct Sprites: Decodable {
        public let frontDefault: URL?
        public let frontShiny: URL?
        public let frontFemale: URL?
        public let frontShinyFemale: URL?
        public let backDefault: URL?
        public let backShiny: URL?
        public let backFemale: URL?
        public let backShinyFemale: URL?

        public init(
            frontDefault: URL? = nil,
            frontShiny: URL? = nil,
            frontFemale: URL? = nil,
            frontShinyFemale: URL? = nil,
            backDefault: URL? = nil,
            backShiny: URL? = nil,
            backFemale: URL? = nil,
            backShinyFemale: URL? = nil
        ) {
            self.frontDefault = frontDefault
            self.frontShiny = frontShiny
            self.frontFemale = frontFemale
            self.frontShinyFemale = frontShinyFemale
            self.backDefault = backDefault
            self.backShiny = backShiny
            self.backFemale = backFemale
            self.backShinyFemale = backShinyFemale
        }
    }
}
