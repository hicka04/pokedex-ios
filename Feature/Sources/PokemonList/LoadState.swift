//
//  LoadState.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

enum LoadState: Equatable {
    static func == (lhs: LoadState, rhs: LoadState) -> Bool {
        switch (lhs, rhs) {
        case (.blank, .blank),
            (.loading, .loading),
            (.ideal, .ideal),
            (.partial, .partial):
            return true

        case let (.failure(lhsError), .failure(rhsError))
            where lhsError.localizedDescription == rhsError.localizedDescription:
            return true

        default:
            return false
        }
    }

    case blank
    case loading
    case partial
    case ideal
    case failure(Error)
}
