//
//  TextModifiers.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import SwiftUI


struct TextModifiers: ViewModifier {
    private let textColor: Color
    private let font: Font
    private let fontWeight: Font.Weight
    
    init(textColor: Color, font: Font, fontWeight: Font.Weight = .regular) {
        self.textColor = textColor
        self.font = font
        self.fontWeight = fontWeight
    }
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(textColor)
            .fontWeight(fontWeight)
    }
}

extension Text{
    func textModifier(textColor: Color, font: Font, fontWeight: Font.Weight = .regular)  -> some View{
        self.modifier(TextModifiers(textColor: textColor, font: font, fontWeight: fontWeight))
    }
}
