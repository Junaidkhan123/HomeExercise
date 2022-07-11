//
//  TrendingRepoWebServiceProtocol.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
protocol TrendingRepoWebServiceProtocol {
    func getTrendingRepositories(completion: @escaping(Result<TrendingRepo, Error>) -> Void)
}

