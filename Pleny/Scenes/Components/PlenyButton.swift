//
//  PlenyButton.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import SwiftUI

struct PlenyButton: View {
    
    var btnTitle: String
    var btnColor: Color
    var btnTitleColor: Color
    var isEnabled: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(btnTitle)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(btnTitleColor)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(btnColor)
                        .padding(.horizontal)
                )
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.5) //  Dim when disabled
    }
}

#Preview {
    PlenyButton(btnTitle: "Sign In", btnColor: Color("primaryColor"), btnTitleColor: Color.white, isEnabled: false) {
        print("Button Tapped")
    }
}
