//
//  PokemonDetailViewComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import NeedleFoundation
import SwiftUI
import Entity

public protocol PokemonDetailViewDependency: Dependency {
    var getEvolutionChainUseCaseComponent: GetEvolutionChainUseCaseComponent { get }
}

public final class PokemonDetailViewComponent: Component<PokemonDetailViewDependency> {}
