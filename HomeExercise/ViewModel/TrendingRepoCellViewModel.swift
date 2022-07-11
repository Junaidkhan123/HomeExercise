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
    func getLanguageColor() -> String
    func getLanguage() -> String
    func getGrade() -> String
}

class TrendingRepoCellViewModel {
    
}
