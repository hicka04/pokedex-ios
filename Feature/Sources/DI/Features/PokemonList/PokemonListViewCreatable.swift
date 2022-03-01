//
//  PokemonListViewCreatable.swift
//  
//
//  Created by hicka04 on 2022/02/28.
//

import Foundation
import SwiftUI

public protocol PokemonListViewCreatable {
    @MainActor
    func create() -> AnyView
}
