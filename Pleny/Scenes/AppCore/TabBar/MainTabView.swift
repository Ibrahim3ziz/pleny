//
//  MainTabView.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("", image: "icon-tabbar-home")
                }
        }
    }
}
