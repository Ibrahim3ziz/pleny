//
//  AuthRepository.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Combine
import NetworkKit

protocol AuthRepositoryInterface: AnyObject {
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError>
}

final class AuthRepository: AuthRepositoryInterface {
    
    private let remoteDataSource: AuthRemoteDataSourceInterface
    
    init(remoteDataSource: AuthRemoteDataSourceInterface = AuthRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError> {
        remoteDataSource.login(body: body)
    }
}
