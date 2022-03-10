//
//  OfficialArtworkImage.swift
//  
//
//  Created by hicka04 on 2022/02/22.
//

import SwiftUI
import Entity
import Core

public struct OfficialArtworkImage: View {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        GeometryReader { proxy in
            AsyncImage(
                url: url,
                content: { $0.resizable() },
                placeholder: { ProgressView() }
            ).frame(
                width: min(proxy.size.width, proxy.size.height),
                height: min(proxy.size.width, proxy.size.height)
            )
        }.scaledToFit()
    }
}

struct OfficialArtworkImage_Previews: PreviewProvider {
    static var previews: some View {
        OfficialArtworkImage(
            url: Pokemon.Sprites.bulbasaur.officialArtwork
        ).previewLayout(.sizeThatFits)
    }
}
