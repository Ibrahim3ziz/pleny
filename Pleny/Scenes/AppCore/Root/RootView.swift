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
            switch coordinator.currentFlow {
            case .auth:
                AuthView()
                    .environmentObject(coordinator)
            case .main:
                MainTabView()
                    .environmentObject(coordinator)
            }
        }
    }
}
