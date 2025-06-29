//
//  PostImageGrid.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 29/06/2025.
//

import SwiftUI

struct PostImageGrid: View {
    let images: [String]
    
    var body: some View {
        switch images.count {
        case 1:
            singleImage(images[0])
        case 2:
            twoImages(images)
        case 3:
            threeImages(images)
        case 4:
            fourImages(images)
        default:
            gridWithMoreThanFour(images)
        }
    }
    
    private func singleImage(_ image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(height: 180)
            .clipped()
            .cornerRadius(8)
    }
    
    private func twoImages(_ images: [String]) -> some View {
        HStack(spacing: 4) {
            ForEach(images.prefix(2), id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .cornerRadius(8)
    }
    
    private func threeImages(_ images: [String]) -> some View {
        HStack(spacing: 4) {
            Image(images[0])
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.75, height: 350)
                .clipped()
            
            VStack(spacing: 4) {
                ForEach(images[1...2], id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 174)
                        .clipped()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .cornerRadius(8)
    }
    
    private func fourImages(_ images: [String]) -> some View {
        HStack(spacing: 4) {
            ForEach(0..<2) { column in
                VStack(spacing: 4) {
                    ForEach(0..<2) { row in
                        Image(images[column * 2 + row])
                            .resizable()
                            .scaledToFill()
                            .frame(height: 174)
                            .clipped()
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32 - 4)
        .cornerRadius(8)
    }
    
    private func gridWithMoreThanFour(_ images: [String]) -> some View {
        let cellWidth = (UIScreen.main.bounds.width - 32 - 4) / 2
        return HStack(spacing: 4) {
            VStack(spacing: 4) {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: cellWidth, height: 174)
                    .clipped()
                
                Image(images[1])
                    .resizable()
                    .scaledToFill()
                    .frame(width: cellWidth, height: 174)
                    .clipped()
            }
            
            VStack(spacing: 4) {
                Image(images[2])
                    .resizable()
                    .scaledToFill()
                    .frame(width: cellWidth, height: 174)
                    .clipped()
                
                ZStack {
                    Image(images[3])
                        .resizable()
                        .scaledToFill()
                        .frame(width: cellWidth, height: 174)
                        .clipped()
                    
                    Color.black.opacity(0.6)
                    
                    Text("+\(images.count - 4)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(width: cellWidth, height: 174)
                .clipped()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .cornerRadius(8)
    }
}
