//
//  Type.swift
//  
//
//  Created by hicka04 on 2022/01/16.
//

import Foundation
import Entity

extension PokemonResponse {
    struct `Type`: Decodable, TranslatableToEntity {
        let slot: Int
        let type: TypeName

        func translate() -> Pokemon.`Type` {
            .init(rawValue: type.name)!
        }
    }
}

typealias TypeName = NamedResponse

extension Array: TranslatableToEntity where Element == PokemonResponse.`Type` {
    func translate() -> Pokemon.Types {
        let first: Pokemon.`Type` = self[0].translate()
        let second: Pokemon.`Type`? = {
            guard self.count > 1 else {
                return nil
            }
            return self[1].translate()
        }()
        return .init(
            first: first,
            second: second
        )
    }
}
