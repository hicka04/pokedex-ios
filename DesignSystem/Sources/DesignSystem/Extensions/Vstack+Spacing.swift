//
//  VStack+Spacing.swift
//  
//
//  Created by hicka04 on 2023/04/09.
//

import SwiftUI

public extension VStack {
    init(
        alignment: HorizontalAlignment = .center,
        spacing: Spacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.rawValue,
            content: content
        )
    }
}

public extension LazyVStack {
    init(
        alignment: HorizontalAlignment = .center,
        spacing: Spacing,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.rawValue,
            pinnedViews: pinnedViews,
            content: content
        )
    }
}
