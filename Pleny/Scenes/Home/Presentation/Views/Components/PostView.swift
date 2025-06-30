//
//  PostView.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct PostView: View {
    @State var username: String
    @State var date: String
    @State var profileImage: String
    @State var post: String
    @State var postImages: [String]?
    var profileImageAction: (() -> Void)?
    var postImageAction: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Image(profileImage) // profile picture
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        profileImageAction?()
                    }
                
                VStack(alignment: .leading) {
                    Text(username) // username
                        .font(.caption)
                        .foregroundColor(.primary)
                    
                    Text(date) // date
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            Text(post) // post
                .font(.body)
            
            if postImages?.count ?? 0 > 0 {
                PostImageGrid(images: postImages ?? []) {
                    postImageAction?()
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.all, 16)
        .background(.white)
        
    }
}

#Preview {
    PostView(username: "Ibrahim", date: "2 days ago", profileImage: "static-profile-image", post: " Need a quick and easy dinner idea? Whip up some creamy macaroni and cheese with bacon bits for a tasty meal that's sure to please", postImages: ["static-post-image"])
}
