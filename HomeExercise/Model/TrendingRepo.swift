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
    let reposioryDescription: String
    let starCount: Int
    let language: String?

    enum CodingKeys: String, CodingKey {
        case name, owner
        case reposioryDescription = "description"
        case starCount = "stargazers_count"
        case language
    }
}

struct Owner: Decodable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

extension Owner {
    static var mocked: [Owner] = [
        Owner(login: "Junaid", avatarURL: "https://avatars.githubusercontent.com/u/25044194?v=4")
    ]
}
extension TrendingRepositories {
    static var mocked : [TrendingRepositories] =
    [
        TrendingRepositories(name: "Artist", owner: Owner.mocked[0], reposioryDescription: "A Beautiful Programming Language", starCount: 0, language: "Swift"),
        TrendingRepositories(name: "Artitst", owner: Owner.mocked[0], reposioryDescription: "", starCount: 0, language: nil),
        TrendingRepositories(name: "Artitst", owner: Owner.mocked[0], reposioryDescription: "", starCount: 0, language: "Swift"),
    ]
}
