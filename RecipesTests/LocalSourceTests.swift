//
//  LocalSourceTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes

final class LocalSourceTests: XCTestCase {
    var localSource: LocalSourceProtocol!
    let recipe = Recipe(id: "1", name: "Egg with milk", image: "", country: "EG", calories: "20C", headline: "nothing")
    
    override func setUpWithError() throws {
        localSource = LocalSource()
    }
    
    override func tearDownWithError() throws {
        localSource = nil
    }
    
    func testInsertRecipe() {
        let count = localSource.getDataFromLocal().count
        localSource.insertRecipe(recipe: recipe)
        XCTAssertEqual(localSource.getDataFromLocal().count, count + 1)
    }
    
    func testGetDataFromLocal() {
        let count = localSource.getDataFromLocal().count
        XCTAssertEqual(localSource.getDataFromLocal().count, count)
        localSource.insertRecipe(recipe: recipe)
        XCTAssertEqual(localSource.getDataFromLocal().count, count + 1)
        
    }
    
    func testGetRecipeFromLocal()  {
        localSource.insertRecipe(recipe: recipe)
        XCTAssertEqual(localSource.getRecipeFromLocal(id: recipe.id)?.name, recipe.name)
    }
    
    func testDeleteFromLocal() {
        let count = localSource.getDataFromLocal().count
        localSource.insertRecipe(recipe: recipe)
        XCTAssertEqual(localSource.getDataFromLocal().count, count + 1)
        localSource.deleteFromLocal(id: recipe.id)
        XCTAssertEqual(localSource.getDataFromLocal().count, count)
        
    }
    
    
}
