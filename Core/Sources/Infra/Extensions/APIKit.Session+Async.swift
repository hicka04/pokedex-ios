//
//  APIKit.Session+Async.swift
//  
//
//  Created by hicka04 on 2021/12/29.
//

import Foundation
import APIKit

extension Session {
    func send<Request: APIKit.Request>(_ request: Request, callbackQueue: CallbackQueue? = nil) async throws -> Request.Response {
        var sessionTask: SessionTask?
        let onCancel = { sessionTask?.cancel() }
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                sessionTask = self.send(request, callbackQueue: callbackQueue) { result in
                    continuation.resume(with: result)
                }
            }
        } onCancel: {
            onCancel()
        }
    }
}
