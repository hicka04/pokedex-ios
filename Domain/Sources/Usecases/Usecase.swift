//
//  UseCase.swift
//  
//
//  Created by hicka04 on 2021/12/27.
//

import Foundation

public protocol UseCase {
    associatedtype Input
    associatedtype Output

    func execute(_ input: Input) async throws -> Output
}
