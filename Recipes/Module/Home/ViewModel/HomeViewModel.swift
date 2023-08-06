//
//  HomeViewModel.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

class HomeViewModel {
    var network: NetworkProtocol!
    var passRecipesToViewController: (()->()) = {}
    var recipes: [Recipe] = [] {
        didSet{
            passRecipesToViewController()
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func logout() {
        
        UserDefault().setUser(email: "", password: "")
    }
    
    func getData() {
        network.getData { [weak self] response in
            
            self?.recipes = response ?? []
        }
    }
    
    func checkInternetConnection() -> Bool {
        return InternetConnection.sharedInstance.isConnectedToInternet()
    }
    
}
