//
//  MockApiService.swift
//  SakeSpotTests
//
//  Created by ReetDhillon on 2025-06-21.
//

import Foundation
import Combine
@testable import SakeSpot

class MockApiService{
    private let mockFileName: String
    
    init(mockFileName: String) {
        self.mockFileName = mockFileName
    }
    
    //MARK: - Fetch data
    func fetchData<T: Decodable>() -> Future<T, SakeSpot.NetworkError>{
        return Future<T, NetworkError> { [weak self] promise in
            guard let self = self , let data = self.getDataFromJsonFile(fileName: self.mockFileName) else {
                return promise(.failure(.badResponse))
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                promise(.success(json))
            } catch {
                promise(.failure(.badResponse))
            }
        }
    }
    
    //MARK: - Get Data from JSON File
    func getDataFromJsonFile(fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        } else{
            return nil
        }
        
    }
}

extension MockApiService : SakeShopAPIOperations {
    func getSakeShopList() -> Future<SakeShopsResponse, NetworkError>{
        return self.fetchData()
    }
}
