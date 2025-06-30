//
//  Posts.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Foundation

// MARK: - Post response
struct PostsEntity: Decodable {
    let posts: [Post]
    let total, skip, limit: Int
}

// MARK: - Post
struct Post: Decodable {
    let id: Int
    let title, body: String
    let tags: [String]
    let reactions: Reactions
    let views, userID: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, body, tags, reactions, views
        case userID = "userId"
    }
}

// MARK: - Reactions
struct Reactions: Decodable {
    let likes, dislikes: Int
}
