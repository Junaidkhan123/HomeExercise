//
//  TrendingViewModelTest.swift
//  HomeExerciseTests
//
//  Created by Junaid on 11/07/2022.
//

import XCTest
@testable import HomeExercise
class TrendingViewModelTest: XCTestCase {
    var sut: TrendingRepoViewModel!
    var apiService: MockTrendingRepoWebService!
    override func setUpWithError() throws {

        apiService = MockTrendingRepoWebService()
        sut = TrendingRepoViewModel(apiService: apiService)
        apiService.isFetchTrendingCalled = true

    }

    override func tearDownWithError() throws {
        sut = nil
        apiService = nil
    }

    func testTrendingViewModel_WhenTitleMatch_ShoudlReturnTrue() {
        //Arrange
        //Act
        let title =  sut.getTitle()
        //Assert
        XCTAssertEqual(title, "Trending" , " sut.getTitle() should have equal have to Trending")
    }

    func testTrendingViewModel_WhenNumberofRepoEqual_ShoudlReturnTrue() {
        //Arrange
        //Act
        sut.fetchTrendingData()
        let repoCount =  sut.numberOfRepo()
        //Assert
        XCTAssertEqual(repoCount, 3 , " sut.numberOfRepo() should have equal to 3")

    }

    func testTrendingViewModel_WhenFetchTrendindData_ReloadTableViewClosure_ShouldCall() {
        //Arrange

        let reloadTableViewExpectations = expectation(description: "ReloadTableViewClosure")
        //Act
        sut.reloadTableViewData = {
            reloadTableViewExpectations.fulfill()

            // Assert
            XCTAssert(true, "reloadTableViewData closure should have executed by fetching Trending")
        }

        sut.fetchTrendingData()
        wait(for: [reloadTableViewExpectations], timeout: 3)
    }

    func testTrendingViewModel_WhenFetchedTrendingData_FailedRequest_UpdateLoadingStatus_ShouldCall() {
        //Arrange
        apiService.shouldReturnError = true
        let updateLoadingExpectations = expectation(description: "updateLoadingExpectations")


        //Act

        sut.updateLoadingStatus = {
            updateLoadingExpectations.fulfill()
        }

        sut.fetchTrendingData()
        wait(for: [updateLoadingExpectations], timeout: 3)

    }

    func testTrendingViewModel_WhenFetchedTrendingData_TrendingCellViewModel_ShouldProcess() {

        //Act
        sut.fetchTrendingData()
        let cellViewModel = sut.trendingCellViewModel(for: 0)
        XCTAssertNotNil(cellViewModel, "sut.trendingCellViewModel(for: 0) should return a TrendindCellViewModel")
    }


}
