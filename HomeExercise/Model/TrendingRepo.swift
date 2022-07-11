//
//  TrendingRepo.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
struct TrendingRepo: Decodable {
    let items: [TrendingRepositories]
}

struct TrendingRepositories: Decodable {
    let name: String?
    let owner: Owner?
    let description: String?
    let stargazers_count: Int?
    let language: String?
}

struct Owner: Decodable {
    let login: String?
    let avatar_url: String?
}
