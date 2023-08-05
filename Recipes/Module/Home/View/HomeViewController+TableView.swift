//
//  HomeViewController+TableView.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recipeCell, for: indexPath) as! RecipeTableViewCell
        
        cell.setValues(recipe: currentRecipes[indexPath.row])
        
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
        recipeDetails.recipe = currentRecipes[indexPath.row]
        navigationController?.pushViewController(recipeDetails, animated: true)
    }
    
    
}
