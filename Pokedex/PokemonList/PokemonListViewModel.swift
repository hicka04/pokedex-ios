//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/05.
//

import Foundation
import Entity
import UseCase

@MainActor
final class PokemonListViewModel<GetPokemonListInteractor: GetPokemonListUseCase>: ObservableObject {
    @Published private(set) var pokemonList: [PokemonListElement] = []
    @Published private(set) var getPokemonListError: Error?

    private let getPokemonListInteractor: GetPokemonListInteractor

    init(getPokemonListInteractor: GetPokemonListInteractor) {
        self.getPokemonListInteractor = getPokemonListInteractor
    }

    func onAppear() async {
        do {
            pokemonList = try await getPokemonListInteractor.execute()
        } catch {
            getPokemonListError = error
        }
    }
}
