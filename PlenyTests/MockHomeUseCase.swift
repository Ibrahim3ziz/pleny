//
//  MockHomeUseCase.swift
//  PlenyTests
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Combine
import NetworkKit
@testable import Pleny

// MARK: - Mock Use Case
final class MockHomeUseCase: HomeUseCaseInterface {
    
    var fetchPostsResult: AnyPublisher<Pleny.PostsEntity, NetworkKit.NetworkError> =
        Just(PostsEntity(posts: [], total: 0, skip: 0, limit: 0))
        .setFailureType(to: NetworkKit.NetworkError.self)
        .eraseToAnyPublisher()

    var searchPostsResult: AnyPublisher<Pleny.PostsEntity, NetworkKit.NetworkError> =
        Just(PostsEntity(posts: [], total: 0, skip: 0, limit: 0))
        .setFailureType(to: NetworkKit.NetworkError.self)
        .eraseToAnyPublisher()
    
    func fetchPosts() -> AnyPublisher<Pleny.PostsEntity, NetworkKit.NetworkError> {
        fetchPostsResult
    }

    func searchPosts(query: String) -> AnyPublisher<Pleny.PostsEntity, NetworkKit.NetworkError> {
        searchPostsResult
    }
}
