//
//  TrendingRepoCellViewModel.swift
//  HomeExerciseTests
//
//  Created by Junaid on 11/07/2022.
//

import XCTest
@testable import HomeExercise
class TrendingRepoCellViewModel: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testTrendingRepoCellViewModel_WhenUserNameFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let userName = sut.getUserName()
        //Assert

        XCTAssertTrue(userName, "Junaid", "userName should have equal to Junaid")
    }

    func testTrendingRepoCellViewModel_WhenRepoNameFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let repoName = sut.getRepoName()
        //Assert

        XCTAssertTrue(repoName, "Home Exercise", "repoName should have equal to Home Exercise")
    }

    func testTrendingRepoCellViewModel_WhenAvatarFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let avatarURL = sut.getUserAvatarURL()
        //Assert

        XCTAssertTrue(avatarURL, "someURLString", "avatarURL should have equal to someURLString")
    }

    func testTrendingRepoCellViewModel_WhenDescriptionFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let description = sut.getRepoDescription()
        //Assert

        XCTAssertTrue(description, "description", "description should have equal to description")
    }


    func testTrendingRepoCellViewModel_WhenLanguageColorFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let languageColor = sut.getLanguageColor()
        //Assert

        XCTAssertTrue(languageColor, "Blue", "languageColor should have equal to Blue")
    }

    func testTrendingRepoCellViewModel_WhenLanguageFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let language = sut.getLanguage()
        //Assert

        XCTAssertTrue(language, "Python", "language should have equal to Python")
    }

    func testTrendingRepoCellViewModel_WhenGradeFetched_ShouldReturnTrue() {
        //Arrange
        let sut = TrendingRepoCellViewModel()
        //Act
        let grade = sut.getGrade()
        //Assert

        XCTAssertTrue(grade, "12", "grade should have equal to 12")
    }

}
