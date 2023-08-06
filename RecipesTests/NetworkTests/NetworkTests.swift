//
//  NetworkTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes

final class NetworkTests: XCTestCase {
    
    var network: NetworkProtocol!
    override func setUpWithError() throws {
        network = Network()
    }
    
    override func tearDownWithError() throws {
        network = nil
    }
    
    func testGetData() {
        let myExpectation = expectation(description: "network")
        network.getData { recipes in
            guard recipes != nil else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            
            XCTAssertNotNil(recipes)
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
