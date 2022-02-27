//
//  GetEvolutionChainUseCaseComponent.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import UseCase
import Repository
import NeedleFoundation

protocol GetEvolutionChainUseCaseDependency: Dependency {
    var pokemonRepository: PokemonRepository { get }
}

final class GetEvolutionChainUseCaseComponent: Component<GetEvolutionChainUseCaseDependency> {
    var getEvolutionChainInteractor: some GetEvolutionChainUseCase {
        GetEvolutionChainInteractor(pokemonRepository: dependency.pokemonRepository)
    }
}
