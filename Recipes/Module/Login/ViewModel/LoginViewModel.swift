//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

class LoginViewModel {
    
    func checkInformation(email: String, password: String) -> Bool {
        if email == Constants.email && password == Constants.password {
            UserDefault().setUser(email: email, password: password)
            return true
        }
        return false
        
    }
}
