//
//  AuthViewModel.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Foundation
import NetworkKit
import Combine

final class AuthViewModel: ObservableObject {
    // MARK: - Dependencies
    private var cancellables = Set<AnyCancellable>()
    private let useCase: AuthUseCaseInterface
    private let coordinator: AppCoordinatorProtocol?
    
    // MARK: - Published Outputs
    @Published var user: UserEntity?
    @Published var isLoading: Bool = false
    @Published var error: NetworkError?
    
    init(useCase: AuthUseCaseInterface = AuthUseCase(),
         coordinator: AppCoordinatorProtocol? = nil
    ) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func login(username: String, password: String) {
        isLoading = true
        error = nil
        useCase.login(body: UserBody(username: username, password: password))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                isLoading = false
                if case let .failure(err) = completion {
                    self.error = err
                }
            } receiveValue: { [weak self] user in
                self?.user = user
                print("User data received: \(user)")
            }.store(in: &cancellables)
    }
}
