//
//  Container.swift
//
//
//  Created by hicka04 on 2022/05/13.
//

import Foundation

/// Provides access to injected dependencies.
public struct Container {

    /// This is only used as an accessor to the computed properties within extensions of `InjectedValues`.
    private static var current = Container()

    /// A static subscript for updating the `currentValue` of `InjectionKey` instances.
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    /// A static subscript accessor for updating and references dependencies directly.
    public static subscript<T>(_ keyPath: WritableKeyPath<Container, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
