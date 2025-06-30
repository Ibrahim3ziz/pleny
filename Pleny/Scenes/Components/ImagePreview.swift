//
//  ImagePreview.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import SwiftUI

struct ImagePreview: View {
    let imageName: String
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { // here to dismiss the image, where ever the user taps.
                    isPresented = false
                }
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
                .onTapGesture { // here to dismiss the image, when the user tap on the image.
                    isPresented = false
                }
        }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.25), value: isPresented)
    }
}


#Preview {
    ImagePreview(imageName: "static-profile-image", isPresented: .constant(true))
}
