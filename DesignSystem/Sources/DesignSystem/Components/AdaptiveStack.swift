//
//  AdaptiveStack.swift
//  
//
//  Created by hicka04 on 2022/03/12.
//

import SwiftUI

public struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: Spacing?
    let content: () -> Content

    public init(
        horizontalAlignment: HorizontalAlignment = .center,
        verticalAlignment: VerticalAlignment = .center,
        spacing: Spacing? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        Group {
            switch horizontalSizeClass {
            case .regular:
                HStack(alignment: verticalAlignment, spacing: spacing?.rawValue, content: content)
            default:
                VStack(alignment: horizontalAlignment, spacing: spacing?.rawValue, content: content)
            }
        }
    }
}

struct AdaptiveStack_Previews: PreviewProvider {
    static var previews: some View {
        let stack = AdaptiveStack {
            Text("first")
            Text("second")
        }

        return Group {
            stack
                .previewDevice(.init(rawValue: "iPad Pro (12.9-inch)"))

            stack
                .previewDevice(.init(rawValue: "iPhone 13"))
        }
    }
}
