//
//  AuthView.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    Image(ImageResource.staticLogin)
                        .resizable()
                        .frame(height: 440)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                    
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("primaryColor"))
                    
                    SimpleInputField(title: "Username", placeholder: "Enter your username", text: .constant(""))
                    
                    SimpleInputField(
                        title: "Password",
                        placeholder: "Enter your password",
                        trailingIcon: "icon-textfield-showPassword",
                        keyboardType: .default,
                        text: .constant(""),
                        tailingIconAction: {
                            print("Training Action")
                        }
                    )
                }
            }
            
            PlenyButton(
                btnTitle: "Sign In",
                btnColor: Color("primaryColor"),
                btnTitleColor: Color.white,
                isEnabled: false
            ) {
                print("Button Tapped")
            }
            .padding(.bottom)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.white)
    }
}


#Preview {
    AuthView()
}
