//
//  AuthUseCase.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import NetworkKit
import Combine

protocol AuthUseCaseInterface: AnyObject {
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError>
}

final class AuthUseCase: AuthUseCaseInterface {
    
    private let repository: AuthRepositoryInterface
    private var cancellable = Set<AnyCancellable>()
    
    init(repository: AuthRepositoryInterface = AuthRepository()) {
        self.repository = repository
    }
    
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError> {
        repository.login(body: body)
    }
}
