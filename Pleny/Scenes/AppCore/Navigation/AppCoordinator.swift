//
//  AppCoordinator.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Foundation

final class AppCoordinator: ObservableObject {
    enum AppFlow {
        case main
        case auth
    }
    
    // TODO: - handle AppFlow
    @Published var currentFlow: AppFlow = .main
    
    func navigateToMainFlow() {
        currentFlow = .main
    }
    
    func navigateToAuthFlow() {
        currentFlow = .auth
    }
}
