//
//  FavouritesViewModel.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

class FavouritesViewModel {
    var localSource: LocalSourceProtocol!
    
    init(localSource: LocalSourceProtocol) {
        self.localSource = localSource
    }
    
    var refreshFavouriteRecipes: (()->()) = {}
    var recipes: [Recipe]?{
        didSet{
            print("Refreshing fav table")
            refreshFavouriteRecipes()
        }
    }
    var returnFavouriteRecipe: (()->()) = {}
    var recipe: Recipe?{
        didSet{
            print("Return selected Recipe")
            returnFavouriteRecipe()
        }
    }
    
    func getRecipes() {
        recipes = localSource.getDataFromLocal()
        print("Refreshing fav table")
    }
    
    
    func getSelectedRecipe(id: String) -> Recipe {
        recipe = localSource.getRecipeFromLocal(id: id)
        print("Return selected recipe")
        return recipe!
    }
    
    func deleteRecipe(recipe: Recipe) {
        localSource.deleteFromLocal(id: recipe.id)
        getRecipes()
    }
}
