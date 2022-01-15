//
//  File.swift
//  
//
//  Created by hicka04 on 2022/01/15.
//

import Foundation

protocol TranslatableToEntity {
    associatedtype Entity

    func translate() throws -> Entity
}
