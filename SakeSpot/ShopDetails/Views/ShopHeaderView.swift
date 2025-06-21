//
//  ShopHeaderView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-21.
//

import SwiftUI

struct ShopHeaderView: View {
    let shop : SakeShops
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            //Shop Title
            Text(shop.title)
                .textModifier(textColor: .white, font: Font.custom(AppFonts.Title_Font, size: 30),fontWeight: .bold)
            
            //Shop Description
            Text(shop.description)
                .textModifier(textColor: .gray, font: Font.custom(AppFonts.subTitle_Font, size: 20),fontWeight: .semibold)
                .lineLimit(15)
        }
    }
}

#Preview {
}
