//
//  FavouritesViewModelTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes
final class FavouritesViewModelTests: XCTestCase {
    
    var favouriteViewModel: FavouritesViewModel!
    var localSource: LocalSourceProtocol!
    let recipe = Recipe(id: "1", name: "Crispy Fish Goujons", image: "", country: "eg", calories: "2 g", headline: "with Spinach and Lemon Couscous")
    override func setUpWithError() throws {
        localSource = MockLocalSource()
        favouriteViewModel = FavouritesViewModel(localSource: localSource)
    }
    
    override func tearDownWithError() throws {
        favouriteViewModel = nil
        localSource = nil
    }
    
    func testGetRecipes() {
        localSource.insertRecipe(recipe: recipe)
        favouriteViewModel.getRecipes()
        XCTAssertEqual(favouriteViewModel.recipes?.count, 1)
        
    }
    
    
    func testGetSelectedRecipe() {
        localSource.insertRecipe(recipe: recipe)
        XCTAssertEqual(favouriteViewModel.getSelectedRecipe(id: recipe.id).name, recipe.name)
    }
    
    func testDeleteRecipe() {
        localSource.insertRecipe(recipe: recipe)
        favouriteViewModel.getRecipes()
        XCTAssertEqual(favouriteViewModel.recipes?.count, 1)
        favouriteViewModel.deleteRecipe(recipe: recipe)
        favouriteViewModel.getRecipes()
        XCTAssertEqual(favouriteViewModel.recipes?.count, 0)
    }
    
}
