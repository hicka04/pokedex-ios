//
//  GetEvolutionChainUseCaseComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import DI
import NeedleFoundation
import UseCase
import Repository

protocol GetEvolutionChainUseCaseDependency: Dependency {
    var pokemonRepository: PokemonRepository { get }
}

final class GetEvolutionChainUseCaseComponent: Component<GetEvolutionChainUseCaseDependency>, Creatable {
    func create(_ parameter: Void) -> some GetEvolutionChainUseCase {
        GetEvolutionChainInteractor(pokemonRepository: dependency.pokemonRepository)
    }
}
