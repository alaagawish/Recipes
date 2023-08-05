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
        recipeDetails.recipe = favouritesRecipes[indexPath.row]
        navigationController?.pushViewController(recipeDetails, animated: true)
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
}
