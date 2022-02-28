//
//  GetPokemonListUseCaseComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/26.
//

import Foundation
import UseCase
import Repository
import NeedleFoundation

protocol GetPokemonListUseCaseDependency: Dependency {
    var pokemonRepository: PokemonRepository { get }
}

final class GetPokemonListUseCaseComponent: Component<GetPokemonListUseCaseDependency>, Creatable {
    func create(_ parameter: Void) -> some GetPokemonListUseCase {
        GetPokemonListInteractor(pokemonRepository: dependency.pokemonRepository)
    }
}
