//
//  Injected.swift
//
//
//  Created by hicka04 on 2022/05/13.
//

import Foundation

@propertyWrapper
public struct Injected<T> {
    private let keyPath: WritableKeyPath<Container, T>
    public var wrappedValue: T {
        get { Container[keyPath] }
        set { Container[keyPath] = newValue }
    }

    public init(_ keyPath: WritableKeyPath<Container, T>) {
        self.keyPath = keyPath
    }
}
