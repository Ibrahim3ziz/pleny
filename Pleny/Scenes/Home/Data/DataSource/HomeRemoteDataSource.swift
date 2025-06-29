//
//  HomeRemoteDataSource.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Combine
import NetworkKit

protocol HomeRemoteDataSourceInterface: AnyObject {
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError>
}

final class HomeRemoteDataSource: HomeRemoteDataSourceInterface {
    private let networkService: NetworkServiceInterface
    
    init(networkService: NetworkServiceInterface = NetworkManager.shared) {
        self.networkService = networkService
    }
    
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError> {
        networkService.execute(FeedRequest(), model: PostsEntity.self)
    }
    }
}
