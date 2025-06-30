//
//  AuthRemotreDataSource.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Combine
import NetworkKit

protocol AuthRemoteDataSourceInterface: AnyObject {
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError>
}

final class AuthRemoteDataSource: AuthRemoteDataSourceInterface {
    private let networkService: NetworkServiceInterface
    
    init(networkService: NetworkServiceInterface = NetworkManager.shared) {
        self.networkService = networkService
    }
    
    func login(body: UserBody) -> AnyPublisher<UserEntity, NetworkError> {
        networkService.execute(AuthRequest(requestBody: body), model: UserEntity.self)
    }
}
