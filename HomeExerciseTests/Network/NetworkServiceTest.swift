//
//  NetworkServiceTest.swift
//  HomeExerciseTests
//
//  Created by Junaid on 12/07/2022.
//

import XCTest
@testable import HomeExercise
class NetworkServiceTest: XCTestCase {

    var sut: NetworkService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration =  URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        sut = NetworkService(url: EndPoint.url, session: session)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testNetworkService_WhenGivenSuccessfulResponse_ReturnsSuccess() {

        // Arrange
        let jsonString = """
        {
            "items": [
                {
                    "name": "cpython",
                    "owner": {
                        "login": "python",
                        "avatar_url": "https://avatars.githubusercontent.com/u/1525981?v=4",
                    },
                    "description": "The Python programming language",
                    "stargazers_count": 46130,
                    "language": "Python",

                }
        ]
        }
        """
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let successFullExpectation = expectation(description: "SuccessfullResponseExpectation")

        //Act

        sut.getTrendingRepositories { result in
            switch result {
            case .success(let repo):
                XCTAssertEqual(repo[0].name, "cpython", "repo[0].name should have equal to cpython")
                //Assert
                successFullExpectation.fulfill()
            case .failure(let error):
                //Assert
                XCTAssertNil(error, "error is not Nil")
            }
        }

        wait(for: [successFullExpectation], timeout: 5)

    }

    func testNetworkService_WhenReceiveDifferentResponse_ReturnErrors() {

        // Arrange
        let jsonString = """
        {
            "items": [
                {
                    "name": "cpython",
                    "owner": {
                        "login": "python",
                        "avatar_url": "https://avatars.githubusercontent.com/u/1525981?v=4",
                    },
                    "description": "The Python programming language",
                    "stargazers_count": 46130,
                    "language": "Python",

                }
        ]
        """
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let differenttExpectation = expectation(description: "DifferentResponseExpectation")

        //Act

        sut.getTrendingRepositories { result in
            switch result {
            case .success(let repo):
                //Assert
                XCTAssertEqual(repo[0].name, "cpython")
            case .failure(let error):
                //Assert
                XCTAssertEqual(error, AppError.invalidData, "error should have equal to The data received from the server was invalid. Please try again.")
                differenttExpectation.fulfill()

            }
        }

        wait(for: [differenttExpectation], timeout: 5)

    }

    func testNetworkService_WhenEmptyURLStringProvided_ReturnErrors() {

        //Arrange
        let emptyURLexpectation = expectation(description: "EmptyURLExpectation")
        sut = NetworkService(url: EndPoint.emptyURL)

        //Act

        sut.getTrendingRepositories { result in
            switch result {
            case .success(let repo):
                //Assert
                XCTAssertEqual(repo[0].name, "cpython")
            case .failure(let error):
                //Assert
                XCTAssertEqual(error, AppError.invalidURL, "error should have equal to invalid url")
                emptyURLexpectation.fulfill()

            }
        }
        wait(for: [emptyURLexpectation], timeout: 5)
    }

    func testNetworkService_WhenRequestFails_ReturnError() {

        //Arrange
        let requestExpectation = expectation(description: "RequstFailExpectation")
        let errorDescription = AppError.unableToComplete
        MockURLProtocol.error = errorDescription

        sut.getTrendingRepositories { result in
            switch result {
            case .success(let repo):
                //Assert
                XCTAssertEqual(repo[0].name, "cpython")
            case .failure(let error):
                //Assert
                XCTAssertEqual(error, AppError.unableToComplete, "error should have equal to unableToComplete")
                requestExpectation.fulfill()

            }
        }
        wait(for: [requestExpectation], timeout: 5)

    }

}
