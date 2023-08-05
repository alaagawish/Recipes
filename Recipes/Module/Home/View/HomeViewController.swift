//
//  HomeViewController.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var logoutImageView: UIImageView!
    @IBOutlet weak var recipesTable: UITableView!
    var homeViewModel: HomeViewModel!
    var disposeBag: DisposeBag!
    var allRecipes: [Recipe] = []
    var currentRecipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        homeViewModel.getData()
        search()
        
        
    }
    
    func initViews() {
        disposeBag = DisposeBag()
        searchBar.delegate = self
        self.recipesTable.register(UINib(nibName: Constants.recipeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.recipeCell)
        
        homeViewModel = HomeViewModel(network: Network())
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        logoutImageView.addGestureRecognizer(tapGesture)
        logoutImageView.isUserInteractionEnabled = true
        homeViewModel.passRecipesToViewController = {
            [weak self] in
            self?.allRecipes = self?.homeViewModel.recipes ?? []
            self?.recipesTable.reloadData()
            
            self?.search()
        }
        
        
    }
    
    @objc func imageViewTapped() {
        let alert = Alert().questionedAlert(title: Constants.logOut, msg: Constants.logOutQuestion) { [weak self] alert in
            
            self?.homeViewModel.logout()
            self?.redirectLogin()
        }
        self.present(alert, animated: true)
        
    }
    
    func search() {
        searchBar.rx.text.subscribe {[weak self] text in
            guard let self = self else {return}
            self.filterList(searchText: text!)
        }.disposed(by: disposeBag)
    }
    
    func filterList(searchText: String) {
        if(!searchText.isEmpty) {
            currentRecipes = allRecipes.filter{ $0.name.lowercased().contains(searchText.lowercased())}
            if currentRecipes.isEmpty {
                currentRecipes = []
            }
        }else {
            currentRecipes = allRecipes
        }
        self.recipesTable.reloadData()
    }
    
    func redirectLogin() {
        dismiss(animated: true)
    }
}
