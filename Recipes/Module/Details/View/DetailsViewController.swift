//
//  DetailsViewController.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var proteins: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var caloriesTitle: UILabel!
    @IBOutlet weak var proteinsTitle: UILabel!
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        checkExistance()
        
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
    
    
    
}
