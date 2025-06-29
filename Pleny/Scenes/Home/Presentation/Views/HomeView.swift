//
//  HomeView.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavBar(text: .constant(""), beginSearching: {
                    // Handle search start
                }, cancelButtonTapped: {
                    // Handle cancel
                })
                
                if viewModel.isLoading {
                    
                    Spacer()
                    
                } else if let error = viewModel.error {
                    Text(error.localizedDescription)
                        .padding()
                    Spacer()
                } else {
                    List(viewModel.posts, id: \.id) { post in
                        PostView(username: "Neama Ahmed", date: "2 days ago", profileImage: "static-profile-image", post: post.title, postImages: ["static-post-image", "static-post-image", "static-post-image", "static-post-image", "static-post-image"])
                    }
                    .listStyle(.plain)
                    .background(.white)
                }
            }
            
            // Centered loading overlay
            if viewModel.isLoading {
                Color.black.opacity(0.1).ignoresSafeArea()
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
            }
        }
        .background(Color.white)
    }
}

#Preview {
    HomeView()
}
