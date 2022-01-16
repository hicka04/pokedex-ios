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
    @Published private(set) var uiState: UiState<[Pokemon]> = .blank

    private let getPokemonListInteractor: GetPokemonListInteractor

    init(getPokemonListInteractor: GetPokemonListInteractor) {
        self.getPokemonListInteractor = getPokemonListInteractor
    }

    func onAppear() async {
        guard uiState.isBlank else {
            return
        }

        do {
            uiState.changeToLoading()
            if let pokemonList = try await getPokemonListInteractor.execute(.first) {
                uiState = .partial(pokemonList)
            } else {
                uiState = .ideal([])
            }
        } catch {
            uiState.changeToError(error)
        }
    }

    func onAppearCell(pokemon: Pokemon) async {
        guard
            let data = uiState.data,
            data.last == pokemon
        else {
            return
        }

        do {
            uiState.changeToLoading()
            if let pokemonList = try await getPokemonListInteractor.execute(.next) {
                uiState = .partial(data + pokemonList)
            } else {
                uiState = .ideal(data)
            }
        } catch {
            uiState.changeToError(error)
        }
    }
}
