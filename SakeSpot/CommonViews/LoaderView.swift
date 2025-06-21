//
//  LoaderView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct LoaderView: View {
    @State var message: String?
    
    var body: some View {
        ProgressView(message ?? AppTitleKeys.LOADING)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.black.opacity(0.2))
            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.theme))
            .foregroundColor(AppColors.theme)
    }
}

#Preview {
    LoaderView()
}
