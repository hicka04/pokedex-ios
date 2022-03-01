//
//  GetEvolutionChainUseCaseComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import NeedleFoundation
import UseCase
import Repository

public protocol GetEvolutionChainUseCaseDependency: Dependency {
    var pokemonRepository: PokemonRepository { get }
}

public final class GetEvolutionChainUseCaseComponent: Component<GetEvolutionChainUseCaseDependency> {
    public func create() -> some GetEvolutionChainUseCase {
        GetEvolutionChainInteractor(pokemonRepository: dependency.pokemonRepository)
    }
}
