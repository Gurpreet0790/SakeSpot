//
//  SakeShopListView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import SwiftUI

struct SakeShopListView: View {
    @StateObject private var viewModel: ShopListViewModel = ShopListViewModel(apiManager: APIManager())
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle(AppNavTitle.HOME_NAV)
                .onAppear {
                    viewModel.getSakeShopList()
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.shopListViewState {
        case .loading:
            LoaderView()
            
        case .error(let error):
            VStack {
                Text("Error: \(error.errorMessage())")
                    .foregroundColor(.red)
                Button(AppTitleKeys.RETRY_BUTTON) {
                    viewModel.getSakeShopList()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        case .noData:
            NoDataFoundView(message: AppPlaceholderStrings.NODATA_PLACEHOLDER)
            
        case .showData:
            List(viewModel.shopListData, id: \.id) { shop in
                NavigationLink(destination: ShopDetailsView(shopDetails: shop)) {
                    ListRowView(item: shop)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .background(Color.black)
                }
            }
            .listStyle(PlainListStyle())
            
        }
    }
}


#Preview {
    // SakeShopListView()
}
