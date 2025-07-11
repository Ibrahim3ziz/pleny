//
//  HomeRepository.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Combine
import NetworkKit

protocol HomeRepositoryInterface: AnyObject {
    func fetchPosts() -> AnyPublisher<PostsResponse, NetworkError>
    func searchPosts(query: String) -> AnyPublisher<PostsResponse, NetworkError>
}

final class HomeRepository: HomeRepositoryInterface {
    
    private let remoteDataSource: HomeRemoteDataSourceInterface
    
    init(remoteDataSource: HomeRemoteDataSourceInterface = HomeRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchPosts() -> AnyPublisher<PostsResponse, NetworkError> {
        remoteDataSource.fetchPosts()
    }
    
    func searchPosts(query: String) -> AnyPublisher<PostsResponse, NetworkError> {
        remoteDataSource.searchPost(query: query)
    }
}
