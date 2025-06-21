//
//  RatingsView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct RatingsView: View {
    let rating: Double
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...maxRating, id: \.self) { index in
                // Check for star fill level
                let starType = self.starType(for: index)
                Image(systemName: starType)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    //MARK: - Add the star image for each position
    private func starType(for index: Int) -> String {
        if rating >= Double(index) {
            return AppImages.FULLSTAR_IMAGE
        } else if rating + 0.5 >= Double(index) {
            return AppImages.HALFSTAR_IMAGE
        } else {
            return AppImages.EMPTYSTAR_IMAGE
        }
    }
}

#Preview {
    RatingsView(rating: 5.0)
}

