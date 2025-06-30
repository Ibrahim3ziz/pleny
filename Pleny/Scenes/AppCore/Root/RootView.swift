//
//  RootView.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch coordinator.currentScreen {
            case .auth:
                AuthView(coordinator: coordinator)
            case .main:
                MainTabView()
            }
        }
        .environmentObject(coordinator)
    }
}
