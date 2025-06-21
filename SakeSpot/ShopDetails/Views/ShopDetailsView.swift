//
//  ShopDetailsView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI


struct ShopDetailsView: View {
    let shopDetails : SakeShops
    @State private var showWebView = false
    
    var body: some View {
        ScrollView {
            VStack{
                showShopDetails()
            }
            .padding(.bottom, 10)
            .padding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
    
    //MARK: - Shop Details
    @ViewBuilder
    private func showShopDetails() -> some View{
        VStack(alignment: .leading, spacing: 20) {
            
            //Shop Image
            CustomAsyncImageView(
                urlString: shopDetails.image,
                width: UIScreen.main.bounds.width - 20,
                height: 250,
                shape: .rounded(16),
                contentMode: .fill,
                borderColor: .accentColor,
                borderWidth: 2
            )
            
            //Show Title and Description
            ShopHeaderView(shop: shopDetails)
            
            //Show Rating
            RatingsView(rating: shopDetails.rating)
            
            
            //Show Address
            MapView(address: shopDetails.title,
                    mapLink: shopDetails.mapLink,
                    locationCoordinates: shopDetails.locationCoordinates
            ) {
                Label(AppTitleKeys.FIND_LOCATION, systemImage: AppImages
                    .MAP_IMAGE)
            }
            
            //Shop WebSite
            Button {
                showWebView = true
            } label: {
                Label(AppTitleKeys.VISIT_WEBSITE, systemImage: AppImages.WEBSITE_IMAGE)
                    .foregroundColor(.blue)
                    .underline()
            }
        }
        .navigationDestination(isPresented: $showWebView){
            WebView(url: shopDetails.website)
                .navigationTitle(shopDetails.title)
        }
    }
}

#Preview {
    //ShopDetailsView()
}
