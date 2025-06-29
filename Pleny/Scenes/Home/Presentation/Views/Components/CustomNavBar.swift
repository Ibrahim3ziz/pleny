//
//  CustomNavBar.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import SwiftUI

struct CustomNavBar: View {
    @State private var isSearchingActive: Bool = false
    @Binding var text: String
    @State var beginSearching: () -> Void
    @State var cancelButtonTapped: () -> Void
    
    var body: some View {
        if isSearchingActive {
            // handle textfield
        } else {
            DefaultNavBar {
                isSearchingActive.toggle()
            }
        }
    }
}

struct DefaultNavBar: View {
    @State var beginSearching: () -> Void
    
    var body: some View {
        HStack {
            Image(ImageResource.logoIcon)
                .padding(.leading)
                .scaledToFit()
                .frame(width: 74, height: 24)

            Spacer()
            
            Button(action: {
                print("Search tapped")
                beginSearching()
                
            }) {
                Image(ImageResource.iconHomeSearch)
                    .padding(.trailing)
                    .frame(width: 24, height: 24)
            }
        }
        .frame(height: 56)
        
        Rectangle()
            .frame(height: 0.5)
            .foregroundColor(Color.gray.opacity(0.4))
    }
}


#Preview {
    CustomNavBar(text: .constant("")) {
        print("")
    } cancelButtonTapped: {
        print("")
    }
}
