//
//  FavouritesViewController+TableView.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import UIKit

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkFavouritesExistance()
        return favouritesRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recipeCell, for: indexPath) as! RecipeTableViewCell
        
        cell.setValues(recipe: favouritesRecipes[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 70)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetails = self.storyboard?.instantiateViewController(withIdentifier: Constants.detailsStoryboard) as! DetailsViewController
        
        if homeViewModel.checkInternetConnection() {
            recipeDetails.recipe =  getRecipeFromNetwork(recipe: favouritesRecipes[indexPath.row])
            
            navigationController?.pushViewController(recipeDetails, animated: true)
            
        } else {
            
            checkInternetAlert()
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let alert = Alert().questionedAlert(title: Constants.delete, msg: Constants.deleteQuestion) { [weak self] alert in
            self?.favouritesViewModel.deleteRecipe(recipe: (self?.favouritesRecipes[indexPath.row])!)
            
            self?.favouriteTable.reloadData()
            
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkFavouritesExistance() {
        if favouritesRecipes.count == 0 {
            favouriteTable.isHidden = true
            noFavouritesLabel.isHidden = false
        }else {
            favouriteTable.isHidden = false
            noFavouritesLabel.isHidden = true
        }
    }
    
    func getRecipeFromNetwork(recipe: Recipe) -> Recipe? {
        
        let recipes = homeViewModel.recipes.filter{$0.id == recipe.id}
        if recipes.count == 0 {
            homeViewModel.getData()
            checkInternetAlert()
            return recipe
        }else {
            return recipes[0]
        }
    }
    
    func checkInternetAlert() {
        let alert  = Alert().errorAlert(title: Constants.connection, msg: Constants.checkConnection)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
