//
//  Stack+Spacing.swift
//  
//
//  Created by hicka04 on 2023/04/09.
//

import SwiftUI

// MARK: - Horizontal
public extension HStack {
    @inlinable init(
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
    @inlinable init(
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

// MARK: - Vertical
public extension VStack {
    @inlinable init(
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
    @inlinable init(
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
