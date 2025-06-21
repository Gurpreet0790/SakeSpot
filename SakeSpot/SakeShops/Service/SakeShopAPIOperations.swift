//
//  SakeShopAPIOperations.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import Combine

protocol SakeShopAPIOperations {
    func getSakeShopList() -> Future<SakeShopsResponse, NetworkError>
}

extension APIManager: SakeShopAPIOperations{
    
    //MARK: Get List of Sake Shops
    func getSakeShopList() -> Future<SakeShopsResponse, NetworkError>{
        guard let apiUrl = APIEndpoints.File.url(for: .sakeShops) else {
            return Future { promise in
                promise(.failure(.invalidURL))
            }
        }
        return self.fetch(from: apiUrl)
    }
}
