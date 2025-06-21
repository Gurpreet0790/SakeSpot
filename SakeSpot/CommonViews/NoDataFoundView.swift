//
//  NoDataFoundView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct NoDataFoundView: View {
    @State var message: String
    @State var icon: String?
    
    
    var isSystemIcon: Bool = false
    var showRetry: Bool = false
    var retryAction :(() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image(systemName: icon ?? AppImages.NO_SHOP_IMAGE)
                .renderingMode(.template)
                .resizable()
                .imageModifier(forgroundColor: .accentColor, height: 80, width: 80, backgroundColor: .clear)
                .scaledToFit()
                .foregroundColor(AppColors.theme)
                .padding()
            
            Text(message)
                .textModifier(textColor: AppColors.theme, font: Font.custom(AppFonts.Title_Font, size: 18))
                .multilineTextAlignment(.leading)
            
            if showRetry, let retryAction = retryAction{
                Button(action: retryAction){
                    Label(AppTitleKeys.RETRY, image: AppImages.RETRY_IMAGE)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
    }
}

#Preview {
    NoDataFoundView(message: AppPlaceholderStrings.NODATA_PLACEHOLDER)
}
