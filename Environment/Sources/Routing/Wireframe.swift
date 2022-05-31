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
    func assembleModules(_ dependency: Dependency) -> AnyView
}

public extension Wireframe where Dependency == Void {
    func assembleModules() -> AnyView {
        self.assembleModules(())
    }
}
