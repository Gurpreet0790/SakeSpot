//
//  ImageModifiers.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import SwiftUI

struct ImageModifiers : ViewModifier {
    private let forgroundColor: Color?
    private let height: CGFloat?
    private let width: CGFloat?
    private let backgroundColor: Color?
    
    init(forgroundColor: Color, height: CGFloat, width: CGFloat, backgroundColor: Color) {
        self.forgroundColor = forgroundColor
        self.height = height
        self.width = width
        self.backgroundColor = backgroundColor
    }
    func body(content: Content) -> some View {
        content
            .foregroundStyle(forgroundColor ?? .white)
            .frame(width: width, height: height)
            .background(backgroundColor ?? .black)
    }
}

extension Image {
    func imageModifier(forgroundColor: Color, height: CGFloat, width: CGFloat, backgroundColor: Color) -> some View {
        self.modifier(ImageModifiers(forgroundColor: forgroundColor, height: height, width: width, backgroundColor: backgroundColor))
    }
}
