//
//  DetailsViewController.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var proteins: UILabel!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var caloriesTitle: UILabel!
    @IBOutlet weak var proteinsTitle: UILabel!
    var recipe: Recipe!
    var detailsViewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setUpUI()
        checkExistance()
        checkItemInFavourites()
    }
    
    func initViews() {
        detailsViewModel = DetailsViewModel(localSource: LocalSource())
        detailsViewModel.getAllFavourites()
    }
    
    func setUpUI() {
        name.text = recipe.name
        proteins.text = recipe.proteins
        calories.text = recipe.calories
        headline.text = recipe.headline
        recipeDescriptionLabel.text = recipe.description
        let url = URL(string: recipe.image)
        recipeImageView.kf.setImage(with: url,
                                    placeholder: UIImage(named: Constants.noImage))
        for ingredient in recipe.ingredients ?? [] {
            ingredients.text = (ingredients.text ?? "") + ingredient + "\n"
            
        }
        
    }
    
    func checkExistance() {
        if recipe.calories.isEmpty {
            calories.isHidden = true
            caloriesTitle.isHidden = true
        }else {
            calories.isHidden = false
            caloriesTitle.isHidden = false
        }
        
        if ((recipe.proteins?.isEmpty) == true) {
            proteins.isHidden = true
            proteinsTitle.isHidden = true
        }else {
            proteins.isHidden = false
            proteinsTitle.isHidden = false
        }
    }
    
    @IBAction func addAndRemoveFavourite(_ sender: Any) {
        
        if favouriteButton.image ==  UIImage(systemName: Constants.heart) {
            
            favouriteButton.image = UIImage(systemName: Constants.fillHeart)
            detailsViewModel.addRecipeToFavourite(recipe: recipe)
            
        }else {
            let alert = Alert().questionedAlert(title: Constants.deleteQuestion, msg: Constants.delete) { [weak self] alert in
                self?.favouriteButton.image = UIImage(systemName: Constants.heart)
                
                self?.detailsViewModel.removeFromFavourites(recipe: (self?.recipe)!)
                
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkItemInFavourites() {
        let favourites =  detailsViewModel.favouriteRecipes.filter{$0.id == recipe.id}
        if favourites.count > 0 {
            favouriteButton.image = UIImage(systemName: Constants.fillHeart)
        }
    }
    
}
