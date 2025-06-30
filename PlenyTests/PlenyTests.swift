//
//  PlenyTests.swift
//  PlenyTests
//
//  Created by Ibrahim Abdul Aziz on 27/06/2025.
//

import XCTest
import Combine
import NetworkKit
@testable import Pleny

final class PlenyTests: XCTestCase {
    
    private var viewModel: HomeViewModel!
    private var mockUseCase: MockHomeUseCase!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUseCase = MockHomeUseCase()
        viewModel = HomeViewModel(useCase: mockUseCase)
        cancellables = []
    }
    
    override func tearDownWithError() throws {
        mockUseCase = nil
        viewModel = nil
        cancellables = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Test Success
    
    func test_getPosts_success_shouldUpdatePosts() {
        // Given
        let expectedPosts = [
            Post(
                id: 1,
                title: "Test",
                body: "Hello",
                tags: ["news"],
                reactions: Reactions(likes: 10, dislikes: 1),
                views: 100,
                userID: 1),
            Post(
                id: 2,
                title: "Another",
                body: "World",
                tags: ["tech"],
                reactions: Reactions(likes: 5, dislikes: 0),
                views: 50,
                userID: 2
            )
        ]
        
        let response = PostsEntity(
            posts: expectedPosts,
            total: 2,
            skip: 0,
            limit: 10
        )
        
        mockUseCase.fetchPostsResult = Just(response)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
        let expectation = XCTestExpectation(description: "Posts updated")
        
        // When
        viewModel.$posts
            .dropFirst()
            .sink { posts in
                XCTAssertEqual(posts.count, 2)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.getPosts()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: - Performance (Optional)
    func testPerformanceExample() throws {
        mockUseCase.fetchPostsResult = Just(PostsEntity(posts: [], total: 0, skip: 0, limit: 10))
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
        measure {
            let expectation = XCTestExpectation(description: "Wait for posts")
            
            viewModel.$posts
                .dropFirst()
                .sink { _ in
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.getPosts()
            wait(for: [expectation], timeout: 1.0)
        }
    }
    
    func testExample() {
        // Given
        let firstNumber = 10
        let secondNumber = 5
        
        // When
        let result = firstNumber + secondNumber
        
        // Then
        XCTAssertEqual(result, 15)
    }
}
