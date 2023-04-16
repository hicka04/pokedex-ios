//
//  APIKit.Request+Cache.swift
//  
//
//  Created by hicka04 on 2022/01/08.
//

import Foundation
import APIKit

extension Request {
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.cachePolicy = .useProtocolCachePolicy
        return urlRequest
    }
}
