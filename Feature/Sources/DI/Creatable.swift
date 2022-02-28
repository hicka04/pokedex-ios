//
//  Creatable.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/28.
//

import Foundation
import SwiftUI

public protocol Creatable {
    associatedtype Parameter
    associatedtype Output

    @MainActor
    func create(_ parameter: Parameter) -> Output
}

public extension Creatable where Parameter == Void {
    @MainActor
    func create() -> Output {
        create(())
    }
}

public protocol ViewCreatable: Creatable where Output: View {}
