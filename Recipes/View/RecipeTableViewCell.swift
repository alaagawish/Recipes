//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeHeadlineLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func setValues(recipe: Recipe) {
        
        recipeNameLabel.text = recipe.name
        recipeHeadlineLabel.text = recipe.headline
        let url = URL(string: recipe.image ?? "" )
        recipeImageView.kf.setImage(with: url,
                                    placeholder: UIImage(named: Constants.noImage))
        
    }
}
