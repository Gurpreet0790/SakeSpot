//
//  ListRowView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct ListRowView: View {
    
    let item : SakeShops?
    
    var body: some View {
  
        HStack(alignment: .center, spacing: 10) {
            
            ListImageView(itemImage: item?.image)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)
            
            //Center Part
            VStack(alignment: .leading, spacing: 5) {
                Text(item?.title ?? AppPlaceholderStrings.NOSHOP_PLACEHOLDER)
                    .textModifier(
                        textColor: .white,
                        font: Font.custom(AppFonts.Title_Font, size: 18)
                    )
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 4)
                
                Text(item?.address ?? AppPlaceholderStrings.NOSHOP_PLACEHOLDER)
                    .textModifier(
                        textColor: .white,
                        font: Font.custom(AppFonts.Title_Font, size: 16),
                        fontWeight: .semibold
                    )
                    .lineLimit(3)
                    .padding(.bottom, 4)
                
                RatingsView(rating: item?.rating ?? 0.0)
                    .font(.caption2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    //ListRowView()
}
