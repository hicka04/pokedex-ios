//
//  GetPokemonListUseCaseComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/26.
//

import Foundation
import NeedleFoundation
import UseCase
import Repository

public protocol GetPokemonListUseCaseDependency: Dependency {
    var pokemonRepository: PokemonRepository { get }
}

public final class GetPokemonListUseCaseComponent: Component<GetPokemonListUseCaseDependency> {
    public func create() -> AnyGetPokemonListUseCase {
        .init(GetPokemonListInteractor(pokemonRepository: dependency.pokemonRepository))
    }
}
