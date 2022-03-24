//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/15.
//

import Foundation
import Entity
import UseCase

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
final class PokemonDetailViewModelImpl<GetEvolutionChainInteractor: GetEvolutionChainUseCase>: PokemonDetailViewModel {
    @Published private(set) var viewState: PokemonDetailViewState

    private let getEvolutionChainInteractor: GetEvolutionChainInteractor

    init(
        pokemon: Pokemon,
        getEvolutionChainInteractor: GetEvolutionChainInteractor
    ) {
        self.viewState = .init(pokemon: pokemon)
        self.getEvolutionChainInteractor = getEvolutionChainInteractor
    }

    func onAppear() async {
        do {
            viewState.evolutionChain = try await getEvolutionChainInteractor.execute(viewState.pokemon.id)
        } catch {
            print(error)
        }
    }
}
