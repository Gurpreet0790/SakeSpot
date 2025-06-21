//
//  ShopListViewModel.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import Combine

enum ViewLoadState {
    case loading
    case showData
    case noData
    case error(error: NetworkError)
}

@MainActor
final class ShopListViewModel : ObservableObject  {
    
    @Published var shopListViewState: ViewLoadState = .loading
    @Published var shopListData : [SakeShops] = [SakeShops]()
    
    
    private var cancellables  = Set<AnyCancellable>()
    private var isViewLoaded: Bool = false
    private let apiManager: SakeShopAPIOperations
    
    
    init(apiManager: SakeShopAPIOperations) {
        self.apiManager = apiManager
    }
    
    //MARK: - Get Sake Shops List
    func getSakeShopList(){
        shopListViewState = .loading
        
        apiManager.getSakeShopList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                
                switch completion{
                case .failure(let error):
                    self.shopListViewState = .error(error: error)
                case .finished:
                    print("Completed Sake Shop List API")
                }
            } receiveValue: { [weak self] shopList in
                guard let self = self else{ return }
                
                self.shopListData = shopList.listOfShops
                self.shopListViewState = self.shopListData.isEmpty ? .noData : .showData
            }
            .store(in: &cancellables)
    }
}



