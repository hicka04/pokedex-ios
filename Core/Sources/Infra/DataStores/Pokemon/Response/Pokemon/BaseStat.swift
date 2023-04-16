//
//  BaseStat.swift
//  
//
//  Created by hicka04 on 2022/02/05.
//

import Foundation
import Entity

extension PokemonResponse {
    struct BaseStat: Decodable {
        let baseStat: Int
        let stat: StatName
    }

    typealias StatName = NamedResponse
}

extension Array where Element == PokemonResponse.BaseStat {
    func translate() -> Pokemon.BaseStats {
        let hp = self.first { $0.stat.name == "hp" }!.baseStat
        let attack = self.first { $0.stat.name == "attack" }!.baseStat
        let defense = self.first { $0.stat.name == "defense" }!.baseStat
        let specialAttack = self.first { $0.stat.name == "special-attack" }!.baseStat
        let specialDefense = self.first { $0.stat.name == "special-defense" }!.baseStat
        let speed = self.first { $0.stat.name == "speed" }!.baseStat

        return .init(
            hp: hp,
            attack: attack,
            defense: defense,
            specialAttack: specialAttack,
            specialDefense: specialDefense,
            speed: speed
        )
    }
}
