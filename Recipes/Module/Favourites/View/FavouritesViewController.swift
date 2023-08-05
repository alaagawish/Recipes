//
//  FavouritesViewController.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var favouriteTable: UITableView!
    @IBOutlet weak var noFavouritesLabel: UILabel!
    var favouritesRecipes: [Recipe] = []
    var favouritesViewModel: FavouritesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    func initViews() {
        
        favouritesViewModel = FavouritesViewModel(localSource: LocalSource())
        self.favouriteTable.register(UINib(nibName: Constants.recipeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.recipeCell)
        
    }

    

}
