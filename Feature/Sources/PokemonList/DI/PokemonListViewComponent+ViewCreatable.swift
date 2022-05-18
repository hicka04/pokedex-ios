//
//  PokemonListViewComponent+ViewCreatable.swift
//  
//
//  Created by hicka04 on 2022/03/01.
//

import Foundation
import DI
import SwiftUI

extension PokemonListViewComponent: PokemonListViewCreatable {
    public func create() -> AnyView {
        .init(
            PokemonListView(
                viewModel: PokemonListViewModelImpl(),
                pokemonDetailViewCreator: self.dependency.pokemonDetailViewCreator
            )
        )
    }
}
