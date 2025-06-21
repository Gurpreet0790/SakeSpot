//
//  View+Extension.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import SwiftUI

extension View {
    
    func applyShape(_ shape: CustomAsyncImageView.ShapeType) -> some View {
        switch shape {
        case .circle:
            return AnyView(self.clipShape(Circle()))
        case .rounded(let radius):
            return AnyView(self.cornerRadius(radius))
        case .none:
            return AnyView(self)
        }
    }
    
    func applyBorderIfNeeded(shape: CustomAsyncImageView.ShapeType, color: Color?, width: CGFloat?) -> some View {
        guard let color = color, let width = width else { return AnyView(self) }
        
        switch shape {
        case .circle:
            return AnyView(self.overlay(Circle().stroke(color, lineWidth: width)))
        case .rounded(let radius):
            return AnyView(self.overlay(RoundedRectangle(cornerRadius: radius).stroke(color, lineWidth: width)))
        default:
            return AnyView(self)
        }
    }
}
