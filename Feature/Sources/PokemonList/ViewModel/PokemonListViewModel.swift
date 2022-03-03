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
protocol PokemonListViewModel: ObservableObject {
    var uiState: UiState<[Pokemon], Int> { get }

    func onAppear() async
    func onAppearCell(pokemon: Pokemon) async
}

@MainActor
final class PokemonListViewModelImpl<GetPokemonListInteractor: GetPokemonListUseCase>: PokemonListViewModel {
    @Published private(set) var uiState: UiState<[Pokemon], Int> = .blank {
        didSet {
            print(uiState)
        }
    }

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
            let page = try await getPokemonListInteractor.execute()
            if let nextOffset = page.nextOffset {
                uiState = .partial(page.items, progress: nextOffset)
            } else {
                uiState = .ideal(page.items)
            }
        } catch {
            uiState.changeToError(error)
        }
    }

    func onAppearCell(pokemon: Pokemon) async {
        guard
            let data = uiState.data,
            data.last == pokemon,
            let nextOffset = uiState.progress
        else {
            return
        }

        do {
            uiState.changeToLoading()
            let page = try await getPokemonListInteractor.execute(nextOffset)
            let pokemonList = data + page.items
            if let nextOffset = page.nextOffset {
                uiState = .partial(pokemonList, progress: nextOffset)
            } else {
                uiState = .ideal(pokemonList)
            }
        } catch {
            uiState.changeToError(error)
        }
    }
}