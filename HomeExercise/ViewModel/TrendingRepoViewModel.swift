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
    var cellViewModelPresentable : [TrendingRepoCellViewModelPresentable]? { get }
    func trendingCellViewModel(for indexPath: Int) -> TrendingRepoCellViewModelPresentable?


}

class TrendingRepoViewModel:  TrendingRepoViewModelPresentable{

     // MARK: - Properties
    private var apiService: TrendingRepoWebServiceProtocol
    private var respostries: [TrendingRepositories]?

     // MARK: - ViewModel Properties And closures
    var reloadTableViewData: (()->())?
    var updateLoadingStatus: (()->())?
    var cellViewModelPresentable: [TrendingRepoCellViewModelPresentable]? = [TrendingRepoCellViewModelPresentable]()

     // MARK: - Init
    init(apiService: TrendingRepoWebServiceProtocol) {
        self.apiService = apiService
    }

     // MARK: - View Model Methods
    func getTitle() -> String {
        return "Trending"
    }

    func numberOfRepo() -> Int {
        respostries?.count ?? 0
    }

    func fetchTrendingData() {
        apiService.getTrendingRepositories { [weak self] result in
            switch result {
            case .success(let repositorires):
                self?.respostries = repositorires
                self?.cellViewModelPresentable = self?.respostries?.compactMap( { TrendingRepoCellViewModel(trendingRepo: $0)} )
                self?.reloadTableViewData?()
            case .failure(_):
                self?.updateLoadingStatus?()
            }
        }
    }

    func trendingCellViewModel(for indexPath: Int) -> TrendingRepoCellViewModelPresentable? {
        return cellViewModelPresentable?[indexPath]
    }
}
