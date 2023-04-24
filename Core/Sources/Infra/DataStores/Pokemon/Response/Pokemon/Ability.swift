//
//  Ability.swift
//  
//
//  Created by hicka04 on 2022/01/20.
//

import Foundation
import Entity

extension PokemonResponse {
    struct Ability: Decodable {
        let ability: Name
        let slot: Int
        let isHidden: Bool
    }

    typealias Abilities = [Ability]
}

extension PokemonResponse.Ability {
    typealias Name = NamedResponse
}

extension [PokemonResponse.Ability] {
    func translate() -> Pokemon.Abilities {
        let first = self.first { $0.slot == 1 }!.ability.translate()
        let second = self.first { $0.slot == 2 }?.ability.translate()
        let hidden = self.first { $0.isHidden }?.ability.translate()
        return .init(first: first, second: second, hidden: hidden)
    }
}

extension PokemonResponse.Ability.Name: TranslatableToEntity {
    func translate() -> Pokemon.Abilities.Ability {
        .init(name: name)
    }
}
