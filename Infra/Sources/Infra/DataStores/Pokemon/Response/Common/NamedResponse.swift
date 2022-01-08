//
//  NamedResponse.swift
//  
//
//  Created by hicka04 on 2022/01/08.
//

import Foundation

struct NamedResponse: Decodable {
    public let name: String
    public let url: URL
}
