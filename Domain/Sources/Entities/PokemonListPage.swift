//
//  PokemonListPage.swift
//  
//
//  Created by hicka04 on 2022/01/17.
//

import Foundation

public struct PokemonListPage {
    public let nextOffset: Int?
    public let items: [Pokemon]

    public init(nextOffset: Int?, items: [Pokemon]) {
        self.nextOffset = nextOffset
        self.items = items
    }
}
