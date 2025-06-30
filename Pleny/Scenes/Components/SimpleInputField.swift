//
//  SimpleInputField.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import SwiftUI

struct SimpleInputField: View {
    var title: String
    var placeholder: String
    var leadingIcon: String?
    var trailingIcon: String?
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    var tailingIconAction: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.leading, 16)
            HStack {
                if let leadingIcon {
                    Image(leadingIcon)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(.leading, 12)
                }
                
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 14)
                
                Button {
                    tailingIconAction?()
                } label: {
                    if let trailingIcon {
                        Image(trailingIcon)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.trailing, 12)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("lightGray"), lineWidth: 1)
            )
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}

#Preview {
    SimpleInputField(title: "Username", placeholder: "Enter your username", text: .constant(""))
    
    SimpleInputField(title: "Password", placeholder: "Enter your password", trailingIcon: "icon-textfield-showPassword", keyboardType: .default, text: .constant(""), tailingIconAction: {
        print("Training Action")
    })
}
