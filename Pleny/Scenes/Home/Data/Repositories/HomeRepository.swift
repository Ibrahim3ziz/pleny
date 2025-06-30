//
//  HomeRepository.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Combine
import NetworkKit

protocol HomeRepositoryInterface: AnyObject {
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError>
    func searchPosts(query: String) -> AnyPublisher<PostsEntity, NetworkError>
}

final class HomeRepository: HomeRepositoryInterface {
    
    private let remoteDataSource: HomeRemoteDataSourceInterface
    
    init(remoteDataSource: HomeRemoteDataSourceInterface = HomeRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError> {
        remoteDataSource.fetchPosts()
    }
    
    func searchPosts(query: String) -> AnyPublisher<PostsEntity, NetworkError> {
        remoteDataSource.searchPost(query: query)
    }
}
