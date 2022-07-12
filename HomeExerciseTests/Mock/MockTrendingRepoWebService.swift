//
//  MockTrendingRepoWebService.swift
//  HomeExerciseTests
//
//  Created by Junaid on 12/07/2022.
//

import Foundation
@testable import HomeExercise
class MockTrendingRepoWebService: TrendingRepoWebServiceProtocol {
    
    var isFetchTrendingCalled = false
    var shouldReturnError = false
    func getTrendingRepositories(completion: @escaping (Result<[TrendingRepositories], AppError>) -> Void) {
        isFetchTrendingCalled = true
        
        if shouldReturnError {
            completion(.failure(AppError.unableToComplete))
        }
        else {
            completion(.success(TrendingRepositories.mocked))
        }
    }
}
