//
//  APIEndpoints.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation

struct APIEndpoints {

    enum File : String {
        case sakeShops = "SakeShopsListData"
        
        static func url(for file: File) -> URL? {
            return Bundle.main.url(forResource: file.rawValue, withExtension: "json")
        }
    }
}
