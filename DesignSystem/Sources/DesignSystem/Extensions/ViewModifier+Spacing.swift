//
//  ViewModifier+Spacing.swift
//  
//
//  Created by hicka04 on 2023/04/09.
//

import SwiftUI

public extension View {
    @inlinable func padding(_ edges: Edge.Set = .all, _ spacing: Spacing) -> some View {
        self.padding(edges, spacing.rawValue)
    }

    @inlinable func padding(_ spacing: Spacing) -> some View {
        self.padding(spacing.rawValue)
    }
}
