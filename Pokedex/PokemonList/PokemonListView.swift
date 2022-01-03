//
//  PokemonListView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/03.
//

import SwiftUI
import Entity
import UseCase
import Infra

@MainActor
struct PokemonListView: View {
    @State var pokemonList: [PokemonListElement] = []

    var body: some View {
        List(pokemonList, id: \.name) { pokemon in
            Text(pokemon.name)
        }.task {
            let useCase = GetPokemonListInteractor(pokemonRepository: PokemonDataStore())
            do {
                self.pokemonList = try await useCase.execute()
            } catch {
                print(error)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
