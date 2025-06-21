//
//  CustomAsyncImageView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct CustomAsyncImageView: View {
    @StateObject private var loader = ImageLoaderViewModel()
    
    let urlString: String?
    let width: CGFloat
    let height: CGFloat
    let shape: ShapeType
    let contentMode: ContentMode
    let borderColor: Color?
    let borderWidth: CGFloat?
    
    enum ShapeType {
        case rounded(CGFloat)
        case circle
        case none
    }
    
    var body: some View {
        
        Group {
            if let urlString = urlString, !urlString.isEmpty {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(width: width, height: height)
                        .applyShape(shape)
                        .applyBorderIfNeeded(shape: shape, color: borderColor, width: borderWidth)
                        .padding(5)
                } else {
                    LoaderView()
                }
            } else {
                // Placeholder if URL is nil or empty
                Image(systemName: AppImages.NO_SHOP_IMAGE)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
        }
        .onAppear{
            if let urlString = urlString, !urlString.isEmpty {
                loader.load(from: urlString)
            }
        }
    }
}


