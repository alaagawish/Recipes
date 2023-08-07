//
//  HomeViewModelTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes

final class HomeViewModelTests: XCTestCase {
    
    var homeViewModel: HomeViewModel!
    var network: NetworkProtocol!
    override func setUpWithError() throws {
        network = MockNetwork(isSuccess: false)
        homeViewModel = HomeViewModel(network: MockNetwork(isSuccess: true))
    }
    
    override func tearDownWithError() throws {
        homeViewModel = nil
        network = nil
    }
    
    
    func testGetData() {
        homeViewModel.getData()
        XCTAssertNotNil(homeViewModel.recipes)
        XCTAssertEqual(homeViewModel.recipes.count, 2)
        
    }
    
    func testGetDataNoNetwork() {
        homeViewModel = HomeViewModel(network: MockNetwork(isSuccess: false))
        homeViewModel.getData()
        XCTAssertEqual(homeViewModel.recipes.count, 0)
    }
    
    func testLogout() {
        homeViewModel.logout()
        XCTAssertEqual(UserDefault().getEmail(), "")
    }
    
    func testConnection() {
        XCTAssertTrue(homeViewModel.checkInternetConnection())
    }
    
}
