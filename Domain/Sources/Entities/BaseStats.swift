//
//  BaseStats.swift
//  
//
//  Created by hicka04 on 2022/02/05.
//

import Foundation

extension Pokemon {
    public struct BaseStats: Equatable, Sendable {
        public let hp: Int
        public let attack: Int
        public let defense: Int
        public let specialAttack: Int
        public let specialDefense: Int
        public let speed: Int

        public init(hp: Int, attack: Int, defense: Int, specialAttack: Int, specialDefense: Int, speed: Int) {
            self.hp = hp
            self.attack = attack
            self.defense = defense
            self.specialAttack = specialAttack
            self.specialDefense = specialDefense
            self.speed = speed
        }
    }
}
