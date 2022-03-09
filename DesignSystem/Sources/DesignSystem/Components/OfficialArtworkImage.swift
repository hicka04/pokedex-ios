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
    let scale: CGFloat

    public init(url: URL, scale: CGFloat = 1.0) {
        self.url = url
        self.scale = scale
    }

    public var body: some View {
        GeometryReader { proxy in
            AsyncImage(
                url: url,
                content: { $0.resizable() },
                placeholder: { ProgressView() }
            )
            .frame(
                width: min(proxy.size.width, proxy.size.height) * scale,
                height: min(proxy.size.width, proxy.size.height) * scale
            ).position(
                x: proxy.frame(in: .local).midX,
                y: proxy.frame(in: .local).midY
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
