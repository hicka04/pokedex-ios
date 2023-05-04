//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity
import UseCase
import UseCaseContainer

@MainActor
protocol PokemonDetailViewModel: ObservableObject {
    var viewState: PokemonDetailViewState { get }

    func onAppear() async
}

struct PokemonDetailViewState {
    let pokemon: Pokemon
    var evolutionChain: EvolutionChain?
}

@MainActor
final class PokemonDetailViewModelImpl: PokemonDetailViewModel {
    @Published private(set) var viewState: PokemonDetailViewState

    @Dependency(\.getEvolutionChainUseCase) private var getEvolutionChain

    init(pokemon: Pokemon) {
        self.viewState = .init(pokemon: pokemon)
    }

    func onAppear() async {
        do {
            viewState.evolutionChain = try await getEvolutionChain(pokemonId: viewState.pokemon.id)
        } catch {
            print(error)
        }
    }
}
