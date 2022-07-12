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
    let name: String
    let owner: Owner
    let repoosioryDescription: String
    let stargazers_count: Int
    let language: String

    enum CodingKeys: String, CodingKey {
        case name, owner
        case repoosioryDescription = "description"
        case stargazers_count
        case language
    }
}

struct Owner: Decodable {
    let login: String
    let avatar_url: String
}

extension Owner {
    static var mocked: [Owner] = [
        Owner(login: "Junaid", avatar_url: "https://avatars.githubusercontent.com/u/25044194?v=4")
    ]
}
extension TrendingRepositories {
    static var mocked : [TrendingRepositories] =
    [
        TrendingRepositories(name: "Artist", owner: Owner.mocked[0], repoosioryDescription: "A Beautiful Programming Language", stargazers_count: 0, language: "Swift"),
        TrendingRepositories(name: "Artitst", owner: Owner.mocked[0], repoosioryDescription: "", stargazers_count: 0, language: "Swift"),
        TrendingRepositories(name: "Artitst", owner: Owner.mocked[0], repoosioryDescription: "", stargazers_count: 0, language: "Swift"),
    ]
}
