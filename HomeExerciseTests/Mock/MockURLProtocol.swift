//
//  MockURLProtocol.swift
//  HomeExerciseTests
//
//  Created by Junaid on 12/07/2022.
//

import Foundation
@testable import HomeExercise
class MockURLProtocol: URLProtocol {

    static var stubResponseData: Data?
    static var error: AppError?

    override class func canInit(with request: URLRequest) -> Bool { return true

    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest { return request }

    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
        }

        else {
            client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }

       client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
