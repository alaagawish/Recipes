//
//  LocalSourceProtocol.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

protocol LocalSourceProtocol {
    func insertRecipe(recipe: Recipe)
    
    func getDataFromLocal() -> [Recipe]
    
    func getRecipeFromLocal(id: String )  -> Recipe?
    
    func deleteFromLocal(id: String )
}
