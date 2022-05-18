//
//  PokemonListViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/26.
//

import Foundation
import NeedleFoundation
import SwiftUI

public protocol PokemonListViewDependency: Dependency {
    var pokemonDetailViewCreator: PokemonDetailViewCreatable { get }
}

public final class PokemonListViewComponent: Component<PokemonListViewDependency> {}
