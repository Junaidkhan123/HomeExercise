//
//  TrendingRepoCellViewModelTest.swift
//  HomeExerciseTests
//
//  Created by Junaid on 11/07/2022.
//

import XCTest
@testable import HomeExercise
class TrendingRepoCellViewModelTest: XCTestCase {

    var sut: TrendingRepoCellViewModel!
    var trendingRepo: TrendingRepositories!
    override func setUpWithError() throws {

//        let data = loadStub(name: "TrendingRepo", extension: "json")
//        let decoder = JSONDecoder()
//        let trendingRepo = try decoder.decode(TrendingRepo.self, from: data)
//        let totalRepo = trendingRepo.items
        trendingRepo = TrendingRepositories.mocked[0]
        sut = TrendingRepoCellViewModel(trendingRepo:  trendingRepo)
    }

    override func tearDownWithError() throws {
        sut = nil
        trendingRepo = nil
    }

    func testTrendingRepoCellViewModel_WhenUserNameFetched_ReturnEqual() {
        //Arrange
        //Act
         let userName = sut.getUserName()
        //Assert
        XCTAssertEqual(userName, "Junaid", "sut.getUserName() should have eqaul to Swift")
    }

    func testTrendingRepoCellViewModel_WhenRepoNameFetched_ShouldReturnTrue() {
        //Arrange
        //Act
        let repoName = sut.getRepoName()
        //Assert

        XCTAssertEqual(repoName, "Artist", "sut.getRepoName() should have eqaul to Artist")

    }

    func testTrendingRepoCellViewModel_WhenAvatarFetched_ShouldReturnTrue() {
        //Arrange
        //Act
        let avatarURL = sut.getUserAvatarURL()
        //Assert

        XCTAssertEqual(avatarURL, "https://avatars.githubusercontent.com/u/25044194?v=4", "sut.getUserAvatarURL() should have eqaul to https://avatars.githubusercontent.com/u/25044194?v=4")
    }
    func testTrendingRepoCellViewModel_WhenDescriptionFetched_ShouldReturnTrue() {
        //Arrange
        //Act
        let description = sut.getRepoDescription()
        //Assert

        XCTAssertEqual(description, "A Beautiful Programming Language", "sut.getRepoDescription() should have equal to A Beautiful Programming Language")
    }

    func testTrendingRepoCellViewModel_WhenLanguageFetched_ShouldReturnTrue() {
        //Arrange
        //Act
        let language = sut.getLanguage()
        //Assert

        XCTAssertEqual(language, "Swift", "sut.getLanguage() should have equal to Swift")
    }

    func testTrendingRepoCellViewModel_WhenGradeFetched_ShouldReturnTrue() {
        //Arrange
        //Act
        let grade = sut.getGrade()
        //Assert

        XCTAssertEqual(grade, 0, "sut.getGrade() should have eqaul to 0 ")

    }

}
