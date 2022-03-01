//
//  PokemonDetailViewComponent+ViewCreatable.swift
//  
//
//  Created by hicka04 on 2022/03/01.
//

import Foundation
import DI
import Entity
import SwiftUI

extension PokemonDetailViewComponent: PokemonDetailViewCreatable {
    public func create(pokemon: Pokemon) -> AnyView {
        .init(
            PokemonDetailView(
                viewModel: PokemonDetailViewModelImpl(
                    pokemon: pokemon,
                    getEvolutionChainInteractor: self.dependency.getEvolutionChainUseCaseComponent.create()
                ),
                evolutionChainViewCreator: evolutionChainViewComponent
            )
        )
    }
}
