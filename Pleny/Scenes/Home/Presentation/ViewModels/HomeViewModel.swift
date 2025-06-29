//
//  HomeViewModel.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Foundation
import NetworkKit
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: - Dependencies
    private var cancellables = Set<AnyCancellable>()
    private let useCase: HomeUseCaseInterface
    
    // MARK: - Published Outputs
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var error: NetworkError?
    
    init(useCase: HomeUseCaseInterface = HomeUseCase()) {
        self.useCase = useCase
    }
    
    func getData() {
        isLoading = true
        error = nil
        useCase.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isLoading = false
                if case let .failure(err) = completion {
                    self.error = err
                }
            } receiveValue: { [weak self] entity in
                self?.posts = entity.posts
            }
            .store(in: &cancellables)
    }
}
