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
        homeViewModel = HomeViewModel(network: network)
    }
    
    override func tearDownWithError() throws {
        homeViewModel = nil
        network = nil
    }
    

    
}
