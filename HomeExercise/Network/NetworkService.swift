//
//  NetworkService.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import Foundation
class NetworkService: TrendingRepoWebServiceProtocol {
    
    var url: String
    var session: URLSession
    init(url: String, session: URLSession = .shared) {
        self.url = url
        self.session = session
    }
    
    func getTrendingRepositories(completion: @escaping (Result<[TrendingRepositories], AppError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(AppError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { data, response, errors in
            if let _ = errors {
                completion(.failure(AppError.unableToComplete))
                return
            }


            if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(TrendingRepo.self, from: data)
                    completion(.success(responseModel.items))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(AppError.invalidData))
                }

            }

            else {
                completion(.failure(AppError.invalidResponse))
            }

        }
        dataTask.resume()
    }
}
