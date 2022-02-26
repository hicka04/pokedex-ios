//
//  OfficialArtworkView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/03.
//

import SwiftUI
import Entity
import Core
import DesignSystem

struct OfficialArtworkView: View {
    let url: URL

    var body: some View {
        GeometryReader { proxy in
            OfficialArtworkImage(url: url)
                .frame(
                    width: proxy.size.width * 0.8,
                    height: proxy.size.width * 0.8
                ).position(
                    x: proxy.size.width / 2,
                    y: proxy.size.height / 2
                )
        }.scaledToFit()
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        OfficialArtworkView(
            url: Pokemon.Sprites.bulbasaur.officialArtwork
        ).previewLayout(.sizeThatFits)
    }
}
