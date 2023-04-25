//
//  Wireframe.swift
//  
//
//  Created by hicka04 on 2022/05/21.
//

import Foundation
import SwiftUI

@MainActor
public protocol Wireframe {
    associatedtype Dependency
    associatedtype View: SwiftUI.View
    func assembleModules(_ dependency: Dependency) -> View
}

public extension Wireframe where Dependency == Void {
    func assembleModules() -> View {
        self.assembleModules(())
    }
}
