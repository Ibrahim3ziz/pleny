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
    
    var fetchPostsResult: AnyPublisher<Pleny.PostsResponse, NetworkKit.NetworkError> =
        Just(PostsResponse(posts: [], total: 0, skip: 0, limit: 0))
        .setFailureType(to: NetworkKit.NetworkError.self)
        .eraseToAnyPublisher()

    var searchPostsResult: AnyPublisher<Pleny.PostsResponse, NetworkKit.NetworkError> =
        Just(PostsResponse(posts: [], total: 0, skip: 0, limit: 0))
        .setFailureType(to: NetworkKit.NetworkError.self)
        .eraseToAnyPublisher()
    
    func fetchPosts() -> AnyPublisher<Pleny.PostsResponse, NetworkKit.NetworkError> {
        fetchPostsResult
    }

    func searchPosts(query: String) -> AnyPublisher<Pleny.PostsResponse, NetworkKit.NetworkError> {
        searchPostsResult
    }
}
