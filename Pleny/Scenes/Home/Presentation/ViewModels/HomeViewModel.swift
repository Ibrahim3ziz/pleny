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
    @Published var isSearching: Bool = false
    @Published var searchText: String = ""
    
    init(useCase: HomeUseCaseInterface = HomeUseCase(), bindSearch: Bool = true) {
        self.useCase = useCase
        if bindSearch {
            $searchText
                .removeDuplicates()
                .sink { [weak self] text in
                    guard let self else { return }
                    
                    if text.isEmpty {
                        self.getPosts()
                    } else if text.count >= 2 {
                        self.searchPosts()
                    }
                }
                .store(in: &cancellables)
        }
    }
    
    func getPosts() {
        isLoading = true
        error = nil
        useCase.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                isLoading = false
                if case let .failure(err) = completion {
                    self.error = err
                }
            } receiveValue: { [weak self] entity in
                self?.posts = entity.posts
            }
            .store(in: &cancellables)
    }
    
    func searchPosts() {
        isLoading = true
        isSearching = true
        error = nil
        useCase.searchPosts(query: searchText)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                isLoading = false
                isSearching = false
                if case let .failure(err) = completion {
                    self.error = err
                }
            } receiveValue: { [weak self] entity in
                self?.posts = entity.posts
            }
            .store(in: &cancellables)
    }
}
