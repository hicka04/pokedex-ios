//
//  OfficialArtworkImage.swift
//  
//
//  Created by hicka04 on 2022/02/22.
//

import SwiftUI
import Entity
import PokedexCore

public struct OfficialArtworkImage: View {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        AsyncImage(
            url: url,
            content: { $0.resizable() },
            placeholder: { ProgressView() }
        ).frame(minWidth: 80, minHeight: 80)
        .aspectRatio(contentMode: .fit)
    }
}

struct OfficialArtworkImage_Previews: PreviewProvider {
    static var previews: some View {
        OfficialArtworkImage(
            url: Pokemon.Sprites.bulbasaur.officialArtwork
        ).previewLayout(.sizeThatFits)
    }
}
