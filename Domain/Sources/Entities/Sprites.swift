//
//  Sprites.swift
//  
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

extension Pokemon {
    public struct Sprites: Equatable, Sendable {
        public let `default`: ViewPoint
        public let female: ViewPoint?
        public let shiny: ViewPoint
        public let shinyFemale: ViewPoint?
        public let officialArtwork: URL

        public init(
            default: ViewPoint,
            female: ViewPoint? = nil,
            shiny: ViewPoint,
            shinyFemale: ViewPoint? = nil,
            officialArtwork: URL
        ) {
            self.default = `default`
            self.female = female
            self.shiny = shiny
            self.shinyFemale = shinyFemale
            self.officialArtwork = officialArtwork
        }
    }
}

extension Pokemon.Sprites {
    public struct ViewPoint: Equatable, Sendable {
        public let front: URL
        public let back: URL

        public init(front: URL, back: URL) {
            self.front = front
            self.back = back
        }

        public init?(front: URL?, back: URL?) {
            guard let front = front,
                  let back = back else {
                return nil
            }
            self.front = front
            self.back = back
        }
    }
}

extension URL: @unchecked Sendable {}
