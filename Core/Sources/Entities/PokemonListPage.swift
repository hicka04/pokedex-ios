//
//  PokemonListPage.swift
//  
//
//  Created by hicka04 on 2022/01/17.
//

import Foundation

public struct PokemonListPage {
    public let nextOffset: Int?
    public let names: [Pokemon.Name]

    public init(nextOffset: Int?, names: [Pokemon.Name]) {
        self.nextOffset = nextOffset
        self.names = names
    }
}
