//
//  RecipesUITests.swift
//  RecipesUITests
//
//  Created by Alaa on 01/08/2023.
//

import XCTest

final class RecipesUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let email =  app.textFields["E-mail"]
        XCTAssertTrue(email.exists)
        email.tap()
        email.typeText("alaa@gmail.com")
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("alaa1234")
        element.tap()
        let login = app.buttons["LogIn"]
        XCTAssertTrue(login.exists)
        login.tap()
        
        
        let recipeDetailsNavigationBar = app.navigationBars["Recipe Details"]
        
        let tabBar = app.tabBars["Tab Bar"]
        
        let withSpinachAndLemonCouscousStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["with Spinach and Lemon Couscous"]/*[[".cells.staticTexts[\"with Spinach and Lemon Couscous\"]",".staticTexts[\"with Spinach and Lemon Couscous\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(withSpinachAndLemonCouscousStaticText.exists)
        withSpinachAndLemonCouscousStaticText.tap()
        let like =   recipeDetailsNavigationBar.buttons["love"]
        XCTAssertTrue(like.exists)
        like.tap()
        let backButton = recipeDetailsNavigationBar.buttons["Back"]
        
        XCTAssertTrue(backButton.exists)
        backButton.tap()
        let home = tabBar.buttons["Home"]
        XCTAssertTrue(home.exists)
        home.tap()
        XCTAssertTrue(home.exists)
        home.tap()
        
        
        let logout = app.images["logout"]
        XCTAssertTrue(logout.exists)
        logout.tap()
        
        let yes = app.alerts["Logging Out"].scrollViews.otherElements.buttons["Yes"]
        XCTAssertTrue(yes.exists)
        yes.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            
            
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
