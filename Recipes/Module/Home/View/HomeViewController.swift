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
        
                
    }
    
    func initViews() {
        disposeBag = DisposeBag()
        searchBar.delegate = self
        homeViewModel = HomeViewModel(network: Network())
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        logoutImageView.addGestureRecognizer(tapGesture)
        logoutImageView.isUserInteractionEnabled = true
        
    }
    
    @objc func imageViewTapped() {
        UserDefault().setUser(email: "", password: "")
    }
    
    func search() {
        searchBar.rx.text.subscribe {[weak self] text in
            guard let self = self else {return}
            self.filterList(searchText: text!)
        }.disposed(by: disposeBag)
    }
    
    func filterList(searchText: String) {
        if(!searchText.isEmpty) {
            currentRecipes = allRecipes.filter{ $0.name!.lowercased().contains(searchText.lowercased())}
            if currentRecipes.isEmpty {
                currentRecipes = []
            }
        }else {
            currentRecipes = allRecipes
        }
        self.recipesTable.reloadData()
    }
    
}
