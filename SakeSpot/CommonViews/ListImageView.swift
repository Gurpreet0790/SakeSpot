//
//  ListImageView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct ListImageView: View {
    let itemImage : String?
    
    var body: some View {
        
        CustomAsyncImageView(
            urlString: itemImage,
            width: 120,
            height: 120,
            shape: .rounded(20),
            contentMode: .fill,
            borderColor: nil,
            borderWidth: nil
        )
    }
}

#Preview {
}
