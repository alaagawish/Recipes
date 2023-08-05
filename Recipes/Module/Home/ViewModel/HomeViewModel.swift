//
//  HomeViewModel.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

class HomeViewModel {
    var network: NetworkProtocol!
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func logout() {
         
            UserDefault().setUser(email: "", password: "")
            
         
    }
}
