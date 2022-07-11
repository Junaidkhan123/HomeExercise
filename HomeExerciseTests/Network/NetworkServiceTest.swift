//
//  NetworkServiceTest.swift
//  HomeExerciseTests
//
//  Created by Junaid on 12/07/2022.
//

import XCTest
@testable import HomeExercise
class NetworkServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkService_WhenSuccessFullResponse_NumberOfItemsNoteqaul_ToZero() {

        //Arrange
        let sut = NetworkService()

        //Act
        sut.getTrendingRepositories { result in
            switch result {
            case .success(let repo):
                XCTAssertTrue(repo.items.count > 0 , "repo.items.count should have value greater than zero" )
            case .failure(let error):
                XCTAssertNil(error, "error should be nil")
            }
        }
    }
}
