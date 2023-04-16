//
//  Sprites.swift
//  
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

extension Pokemon {
    public struct Sprites: Equatable, Sendable {
        public let officialArtwork: URL

        public init(officialArtwork: URL) {
            self.officialArtwork = officialArtwork
        }
    }
}

extension URL: @unchecked Sendable {}
