//
//  DetailsViewModel.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

class DetailsViewModel {
    var localSource: LocalSourceProtocol!
    var favouriteRecipes: [Recipe] = []
    init(localSource: LocalSourceProtocol) {
        self.localSource = localSource
    }
    
    func addRecipeToFavourite(recipe: Recipe) {
        localSource.insertRecipe(recipe: recipe)
    }
    
    func removeFromFavourites(recipe: Recipe) {
        localSource.deleteFromLocal(id: recipe.id)
        
    }
    func getAllFavourites() {
        favouriteRecipes = localSource.getDataFromLocal()
    }
}
