//
//  ViewBuildable.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/27.
//

import Foundation
import SwiftUI

protocol ViewBuildable {
    associatedtype Parameter
    associatedtype View: SwiftUI.View

    @MainActor
    func build(_ parameter: Parameter) -> View
}

extension ViewBuildable where Parameter == Void {
    @MainActor
    func build() -> View {
        build(())
    }
}
