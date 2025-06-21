//
//  NetworkError.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case badResponse
    case decodingError
    case networkError(URLError)
    case dataError(String? = nil)
    
    func errorMessage() -> String {
        switch self {
        case .invalidURL:
            return AppErrorStrings.INVALID_URL
        case .badResponse:
            return AppErrorStrings.BADRESPONSE_ERROR
        case .decodingError:
            return AppErrorStrings.DECODING_ERROR
        case .networkError(let error):
            return error.localizedDescription
        case .dataError(let message):
            return message ?? AppErrorStrings.UNEXPECTED_ERROR
        }
    }
}
