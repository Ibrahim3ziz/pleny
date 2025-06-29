//
//  HomeUseCase.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 29/06/2025.
//

import NetworkKit
import Combine

protocol HomeUseCaseInterface: AnyObject {
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError>
}

final class HomeUseCase: HomeUseCaseInterface {
    
    private let repository: HomeRepositoryInterface
    private var cancellable = Set<AnyCancellable>()
    
    init(repository: HomeRepositoryInterface = HomeRepository()) {
        self.repository = repository
    }
    
    func fetchPosts() -> AnyPublisher<PostsEntity, NetworkError> {
        repository.fetchPosts()
    }
}
