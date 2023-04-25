//
//  Ability.swift
//  
//
//  Created by hicka04 on 2022/01/20.
//

import Foundation

extension Pokemon {
    public struct Abilities: Hashable, Sendable {
        public let first: Ability
        public let second: Ability?
        public let hidden: Ability?

        public init(first: Ability, second: Ability?, hidden: Ability?) {
            self.first = first
            self.second = second
            self.hidden = hidden
        }
    }
}

extension Pokemon.Abilities {
    public struct Ability: Hashable, Sendable {
        public let name: String

        public init(name: String) {
            self.name = name
        }
    }
}
