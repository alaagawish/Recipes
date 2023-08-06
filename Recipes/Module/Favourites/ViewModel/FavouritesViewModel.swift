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
            
            refreshFavouriteRecipes()
        }
    }
    var returnFavouriteRecipe: (()->()) = {}
    var recipe: Recipe?{
        didSet{
            
            returnFavouriteRecipe()
        }
    }
    
    func getRecipes() {
        recipes = localSource.getDataFromLocal()
        
    }
    
    
    func getSelectedRecipe(id: String) -> Recipe {
        recipe = localSource.getRecipeFromLocal(id: id)
        
        return recipe!
    }
    
    func deleteRecipe(recipe: Recipe) {
        localSource.deleteFromLocal(id: recipe.id)
        getRecipes()
    }
}
