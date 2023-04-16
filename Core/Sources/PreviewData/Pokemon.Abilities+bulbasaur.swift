//
//  Pokemon.Abilities+bulbasaur.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/02.
//

import Foundation
import Entity

extension Pokemon.Abilities {
    public static var bulbasaur: Self {
        .init(
            first: .init(name: "overgrow"),
            second: nil,
            hidden: .init(name: "chlorophyll")
        )
    }
}
