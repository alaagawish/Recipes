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
    var homeViewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        favouritesViewModel.getRecipes()
        
    }
    
    func initViews() {
        
        homeViewModel = HomeViewModel(network: Network())
        favouritesViewModel = FavouritesViewModel(localSource: LocalSource())
        
        homeViewModel.getData()
        self.favouriteTable.register(UINib(nibName: Constants.recipeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.recipeCell)
        favouritesViewModel.refreshFavouriteRecipes = {
            [weak self] in
            
            self?.favouritesRecipes = self?.favouritesViewModel.recipes ?? []
            self?.favouriteTable.reloadData()
            
        }
    }
    
}

