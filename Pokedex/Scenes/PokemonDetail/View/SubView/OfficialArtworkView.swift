//
//  OfficialArtworkView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/03.
//

import SwiftUI
import Entity
import PokedexCore

extension PokemonDetailView {
    struct OfficialArtworkView: View {
        let url: URL

        var body: some View {
            GeometryReader { proxy in
                AsyncImage(
                    url: url,
                    content: { $0.resizable() },
                    placeholder: { ProgressView() }
                ).frame(
                    width: proxy.size.width * 0.8,
                    height: proxy.size.width * 0.8
                ).position(x: proxy.size.width / 2, y: proxy.size.height / 2)
            }.scaledToFit()
        }
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView.OfficialArtworkView(
            url: Pokemon.Sprites.bulbasaur.officialArtwork
        ).previewLayout(.sizeThatFits)
    }
}
