//
//  GridItem+Spacing.swift
//  
//
//  Created by hicka04 on 2023/04/28.
//

import SwiftUI

extension LazyVGrid {
    public init(
        columns: [GridItem],
        alignment: HorizontalAlignment = .center,
        spacing: Spacing,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            columns: columns,
            alignment: alignment,
            spacing: spacing.rawValue,
            pinnedViews: pinnedViews,
            content: content
        )
    }
}

extension GridItem {
    public init(
        _ size: GridItem.Size = .flexible(),
        spacing: Spacing,
        alignment: Alignment? = nil
    ) {
        self.init(size, spacing: spacing.rawValue, alignment: alignment)
    }
}
