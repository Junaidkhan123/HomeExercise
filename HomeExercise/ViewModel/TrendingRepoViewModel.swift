//
//  TrendingRepoViewModel.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
protocol TrendingRepoViewModelPresentable {
    func getTitle() -> String
    func numberOfRepo()-> Int
    func fetchTrendingData()
    var reloadTableViewData: (()->())? { get set }
    var updateLoadingStatus: (()->())? { get set }
}

class TrendingRepoViewModel {

}
