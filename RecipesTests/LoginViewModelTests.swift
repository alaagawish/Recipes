//
//  LoginViewModelTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes

final class LoginViewModelTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    override func setUpWithError() throws {
        loginViewModel = LoginViewModel()
    }
    
    override func tearDownWithError() throws {
        loginViewModel = nil
    }
    
    func testCheckInformation()  {
        XCTAssertTrue(loginViewModel.checkInformation(email: "alaa@gmail.com", password: "alaa1234"))
    }
    func testCheckInformationFail()  {
        XCTAssertFalse(loginViewModel.checkInformation(email: "alaaa@gmail.com", password: "alaa1234"))
    }
}
