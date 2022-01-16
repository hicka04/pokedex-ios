//
//  UiState.swift
//  Pokedex
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

enum UiState<Data> {
    case blank
    case loading(Data?)
    case partial(Data)
    case ideal(Data)
    case error(Error, Data?)

    var isBlank: Bool {
        switch self {
        case .blank: return true
        default: return false
        }
    }

    var isLoading: Bool {
        switch self {
        case .loading: return true
        default: return false
        }
    }

    mutating func changeToLoading() {
        self = .loading(data)
    }

    mutating func changeToError(_ error: Error) {
        self = .error(error, data)
    }

    var data: Data? {
        switch self {
        case
            let .loading(data?),
            let .partial(data),
            let .ideal(data),
            let .error(_, data?):
            return data

        default:
            return nil
        }
    }

    var error: Error? {
        switch self {
        case let .error(error, _):
            return error

        default:
            return nil
        }
    }
}
