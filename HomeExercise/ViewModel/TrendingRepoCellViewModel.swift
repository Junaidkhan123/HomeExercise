//
//  TrendingRepoCellViewModel.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
protocol TrendingRepoCellViewModelPresentable {
    func getUserName() -> String
    func getRepoName() -> String
    func getUserAvatarURL() -> String
    func getRepoDescription() -> String
    func getLanguage() -> String
    func getGrade() -> Int
}

class TrendingRepoCellViewModel: TrendingRepoCellViewModelPresentable {

     // MARK: - Properties
    private var trendingRepo: TrendingRepositories

    init(trendingRepo: TrendingRepositories) {
        self.trendingRepo = trendingRepo
    }

    func getUserName() -> String {
        trendingRepo.owner.login
    }

    func getRepoName() -> String {
        trendingRepo.name
    }

    func getUserAvatarURL() -> String {
        trendingRepo.owner.avatarURL
    }

    func getRepoDescription() -> String {
        trendingRepo.reposioryDescription
    }

    func getLanguage() -> String {
        trendingRepo.language ?? ""
    }

    func getGrade() -> Int {
        trendingRepo.starCount
    }
}
