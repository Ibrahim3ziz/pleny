//
//  AppCoordinator.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Foundation

protocol AppCoordinatorProtocol {
    func navigateToMainFlow(with user: UserEntity)
    func navigateToAuthFlow()
}

final class AppCoordinator: ObservableObject, AppCoordinatorProtocol {
    enum Screen {
        case main
        case auth
    }
    
    @Published var currentScreen: Screen = .auth
    
    func navigateToMainFlow(with user: UserEntity) {
        currentScreen = .main
    }
    
    func navigateToAuthFlow() {
        currentScreen = .auth
    }
}
