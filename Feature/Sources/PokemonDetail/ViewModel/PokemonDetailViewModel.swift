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
    var pokemon: Pokemon { get }
    var evolutionChain: EvolutionChain? { get }

    func onAppear() async
}

@MainActor
final class PokemonDetailViewModelImpl<GetEvolutionChainInteractor: GetEvolutionChainUseCase>: PokemonDetailViewModel {
    let pokemon: Pokemon
    @Published private(set) var evolutionChain: EvolutionChain?

    private let getEvolutionChainInteractor: GetEvolutionChainInteractor

    init(
        pokemon: Pokemon,
        getEvolutionChainInteractor: GetEvolutionChainInteractor
    ) {
        self.pokemon = pokemon
        self.getEvolutionChainInteractor = getEvolutionChainInteractor
    }

    func onAppear() async {
        do {
            evolutionChain = try await getEvolutionChainInteractor.execute(pokemon.id)
        } catch {
            print(error)
        }
    }
}