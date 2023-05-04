//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/05.
//

import Foundation
import Entity
import UseCase
import UseCaseContainer

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

    @Dependency(\.getPokemonListStreamUseCase) private var getPokemonListStreamInteractor
    private var pokemonListStream: AsyncThrowingStream<[Pokemon], Error>?

    func onAppear() async {
        guard viewState.loadState == .blank else {
            return
        }

        do {
            pokemonListStream = try await getPokemonListStreamInteractor.execute()
            await loadPokemonList()
        } catch {
            viewState.loadState = .failure(error)
        }
    }

    func onAppearCell(pokemon: Pokemon) async {
        guard
            viewState.pokemonList.last == pokemon
        else {
            return
        }

        await loadPokemonList()
    }

    private func loadPokemonList() async {
        do {
            viewState.loadState = .loading
            var iterator = pokemonListStream?.makeAsyncIterator()
            guard let pokemonList = try await iterator?.next() else {
                viewState.loadState = .ideal
                return
            }
            viewState.pokemonList.append(contentsOf: pokemonList)
            viewState.loadState = .partial
        } catch {
            viewState.loadState = .failure(error)
        }
    }
}
