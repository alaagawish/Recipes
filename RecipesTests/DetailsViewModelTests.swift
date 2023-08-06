//
//  DetailsViewModelTests.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import XCTest
@testable import Recipes

final class DetailsViewModelTests: XCTestCase {
    
    var detailsViewModel: DetailsViewModel!
    var localSource: LocalSourceProtocol!
    let recipe = Recipe(id: "1", name: "Crispy Fish Goujons", image: "", country: "eg", calories: "2 g", headline: "with Spinach and Lemon Couscous")
    
    override func setUpWithError() throws {
        localSource = MockLocalSource()
        detailsViewModel = DetailsViewModel(localSource: localSource)
    }
    
    override func tearDownWithError() throws {
        detailsViewModel = nil
        localSource = nil
    }
    
    func testAddRecipeToFavourite() {
        
        detailsViewModel.addRecipeToFavourite(recipe: recipe)
        detailsViewModel.getAllFavourites()
        XCTAssertEqual(detailsViewModel.favouriteRecipes.count, 1)
    }
    
    func testRemoveFromFavourites() {
        
        detailsViewModel.addRecipeToFavourite(recipe: recipe)
        detailsViewModel.getAllFavourites()
        XCTAssertEqual(detailsViewModel.favouriteRecipes.count, 1)
        detailsViewModel.removeFromFavourites(recipe: recipe)
        detailsViewModel.getAllFavourites()
        XCTAssertEqual(detailsViewModel.favouriteRecipes.count, 0)
    }
    func testGetAllFavourites() {
        XCTAssertEqual(detailsViewModel.favouriteRecipes.count, 0)
        detailsViewModel.addRecipeToFavourite(recipe: recipe)
        detailsViewModel.getAllFavourites()
        XCTAssertEqual(detailsViewModel.favouriteRecipes.count, 1)
    }
}
