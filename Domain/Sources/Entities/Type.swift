//
//  Type.swift
//  
//
//  Created by hicka04 on 2022/01/16.
//

import Foundation

extension Pokemon {
    public struct Types: Equatable, Sendable {
        public let first: Pokemon.`Type`
        public let second: Pokemon.`Type`?

        public init(first: Pokemon.`Type`, second: Pokemon.`Type`?) {
            self.first = first
            self.second = second
        }
    }

    public enum `Type`: String, Equatable, Sendable {
        case normal
        case fighting
        case flying
        case poison
        case ground
        case rock
        case bug
        case ghost
        case steel
        case fire
        case water
        case grass
        case electric
        case psychic
        case ice
        case dragon
        case dark
        case fairy
    }
}
