//
//  SakeShopsViewModelTests.swift
//  SakeSpotTests
//
//  Created by ReetDhillon on 2025-06-21.
//

import XCTest
import Combine
@testable import SakeSpot

final class SakeShopsViewModelTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    
    @MainActor
    func test_fetchSakeShopsData() async {
        let expectation = XCTestExpectation(description: "Wait for shops to load")
        let viewModel = ShopListViewModel(apiManager: MockApiService(mockFileName: "SakeShopsListTestData"))
        
        viewModel.$shopListData
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { shops in
                if shops.count == 10 {
                    XCTAssertEqual(shops.count, 10)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.getSakeShopList()
        
        await fulfillment(of: [expectation], timeout: 2.0)
    }
    
    @MainActor
    func test_fetchSakeShopsData_Empty() async {
        let expectation = XCTestExpectation(description: "Wait for empty shop list")
        let viewModel = ShopListViewModel(apiManager: MockApiService(mockFileName: "SakeShopsListTestData_empty"))
        
        viewModel.$shopListData
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { shops in
                XCTAssertEqual(shops.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.getSakeShopList()
        await fulfillment(of: [expectation], timeout: 2.0)
    }
    
    @MainActor
    func test_fetchSakeShopsData_Error() async {
        let expectation = XCTestExpectation(description: "Wait for error state")
        let viewModel = ShopListViewModel(apiManager: MockApiService(mockFileName: "SakeShopsListTestData_error"))
        
        viewModel.$shopListViewState
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .error(let error):
                    XCTAssertNotNil(error)
                    expectation.fulfill()
                default:
                    break
                }
            }
            .store(in: &cancellables)
        
        viewModel.getSakeShopList()
        await fulfillment(of: [expectation], timeout: 2.0)
    }
}

