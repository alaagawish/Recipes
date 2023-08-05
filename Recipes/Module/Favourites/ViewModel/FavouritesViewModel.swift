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
    
    func deleteRecipe(recipe: Recipe) {
        
    }
}
