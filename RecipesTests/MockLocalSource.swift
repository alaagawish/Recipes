//
//  MockLocalSource.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import Foundation
@testable import Recipes

class MockLocalSource: LocalSourceProtocol {
    var recipesSaved: [Recipe] = []
    
    func insertRecipe(recipe: Recipes.Recipe) {
        recipesSaved.append(recipe)
    }
    
    func getDataFromLocal() -> [Recipes.Recipe] {
        return recipesSaved
    }
    
    func getRecipeFromLocal(id: String) -> Recipes.Recipe? {
        for recipe in recipesSaved {
            if recipe.id == id {
                return recipe
            }
        }
        return nil
    }
    
    func deleteFromLocal(id: String) {
        for index in 0 ..< recipesSaved.count {
            if recipesSaved[index].id == id {
                recipesSaved.remove(at: index)
                break
            }
        }
    }
    
    
    
}
