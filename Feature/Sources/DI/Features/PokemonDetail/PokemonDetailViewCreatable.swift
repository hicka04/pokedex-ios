//
//  PokemonDetailViewCreatable.swift
//  
//
//  Created by hicka04 on 2022/02/28.
//

import Foundation
import Entity
import SwiftUI

public protocol PokemonDetailViewCreatable {
    @MainActor
    func create(pokemon: Pokemon) -> AnyView
}
