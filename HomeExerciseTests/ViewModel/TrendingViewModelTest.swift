//
//  TrendingViewModelTest.swift
//  HomeExerciseTests
//
//  Created by Junaid on 11/07/2022.
//

import XCTest
@testable import HomeExercise
class TrendingViewModelTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testTrendingViewModel_WhenTitleMatch_ShoudlReturnTrue() {
        //Arrange
        let sut = TrendingRepoViewModel()
        //Act
        let title =  sut.getTitle()
        //Assert
        XCTAssertTrue(title, "Trending Repo", "title should have eqaul to Trending Repo")
    }

    func testTrendingViewModel_WhenNumberofRepoEqual_ShoudlReturnTrue() {
        //Arrange
        let sut = TrendingRepoViewModel()
        //Act
        let repoCount =  sut.numberOfRepo()
        //Assert
        XCTAssertTrue(repoCount, "10", "repoCount should have eqaul to 10")

    }

    func testTrendingViewModel_WhenFetchTrendindData_ShouldCalled() {
        //Arrange
        let sut = TrendingRepoViewModel()

        //Act
        sut.fetchTrendingData()
        //Assert
        

    }
}
