//
//  APIManager.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import Combine

class APIManager {
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetch<T: Decodable>(from endpoint: URL?) -> Future<T, NetworkError> {
        return Future<T, NetworkError> { [weak self] promise in
            guard let self = self, let url = endpoint else {
                return promise(.failure(.invalidURL))
            }
            
            // ✅ Handle local JSON files
            if url.isFileURL {
                do {
                    let url = Bundle.main.url(forResource: "SakeShopsListData", withExtension: "json")!
                    let data = try Data(contentsOf: url)
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    promise(.success(decoded))
                } catch {
                    promise(.failure(.dataError()))
                }
                return
            }
            
            // ✅ Handle remote network requests
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                          200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.badResponse
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let networkError as NetworkError:
                            promise(.failure(networkError))
                        default:
                            promise(.failure(.dataError()))
                        }
                    }
                }, receiveValue: { value in
                    promise(.success(value))
                })
                .store(in: &self.cancellables)
        }
    }
}
