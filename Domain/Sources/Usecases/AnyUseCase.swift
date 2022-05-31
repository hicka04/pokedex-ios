//
//  AnyUseCase.swift
//  
//
//  Created by hicka04 on 2022/05/17.
//

import Foundation

public struct AnyUseCase<Input, Output>: UseCase {
    private let _execute: (Input) async throws -> Output

    public init<Base: UseCase>(_ base: Base) where Base.Input == Input, Base.Output == Output {
        _execute = { try await base.execute($0) }
    }

    public func execute(_ input: Input) async throws -> Output {
        try await _execute(input)
    }
}
