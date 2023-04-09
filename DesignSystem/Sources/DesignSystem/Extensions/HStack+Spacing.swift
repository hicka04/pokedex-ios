//
//  Stack+Spacing.swift
//  
//
//  Created by hicka04 on 2023/04/09.
//

import SwiftUI

public extension HStack {
    init(
        alignment: VerticalAlignment = .center,
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

public extension LazyHStack {
    init(
        alignment: VerticalAlignment = .center,
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
