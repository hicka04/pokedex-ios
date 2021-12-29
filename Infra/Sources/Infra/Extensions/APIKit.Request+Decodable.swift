//
//  APIKit.Request+Decodable.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

extension Request where Response: Decodable {
    var dataParser: DataParser {
        OriginalJsonDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        guard (200 ..< 300).contains(urlResponse.statusCode) else {
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }

        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(Response.self, from: data)
    }
}

private struct OriginalJsonDataParser: DataParser {
    var contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        data
    }
}
