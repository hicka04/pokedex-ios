//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/05.
//

import Foundation
import Entity
import UseCase
import Environment

@MainActor
protocol PokemonListViewModel: ObservableObject {
    var viewState: PokemonListViewState { get }

    func onAppear() async
    func onAppearCell(pokemon: Pokemon) async
}

struct PokemonListViewState {
    var loadState: LoadState = .blank
    var pokemonList: [Pokemon] = []
}

@MainActor
final class PokemonListViewModelImpl: PokemonListViewModel {
    @Published private(set) var viewState: PokemonListViewState = .init()

    @Injected(\.getPokemonListUseCase) private var getPokemonListInteractor: AnyGetPokemonListUseCase

    func onAppear() async {
        guard viewState.loadState == .blank else {
            return
        }

        do {
            viewState.loadState = .loading
            let page = try await getPokemonListInteractor.execute(0)
            viewState.pokemonList.append(contentsOf: page.items)
            if let nextOffset = page.nextOffset {
                viewState.loadState = .partial(progress: nextOffset)
            } else {
                viewState.loadState = .ideal
            }
        } catch {
            viewState.loadState = .failure(error)
        }
    }

    func onAppearCell(pokemon: Pokemon) async {
        guard
            viewState.pokemonList.last == pokemon,
            let nextOffset = viewState.loadState.progress
        else {
            return
        }

        do {
            viewState.loadState = .loading
            let page = try await getPokemonListInteractor.execute(nextOffset)
            viewState.pokemonList.append(contentsOf: page.items)
            if let nextOffset = page.nextOffset {
                viewState.loadState = .partial(progress: nextOffset)
            } else {
                viewState.loadState = .ideal
            }
        } catch {
            viewState.loadState = .failure(error)
        }
    }
}
