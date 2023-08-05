//
//  UserDefault.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import Foundation

class UserDefault{
    var userDefaults: UserDefaults!
    
    init() {
        userDefaults = UserDefaults.standard
    }
    func getPassword() -> String {
        
        return userDefaults.string(forKey: Constants.userPassword) ?? ""
    }
    
    func getEmail() -> String {
        return userDefaults.string(forKey: Constants.userEmail) ?? ""
    }
    
    
    func setUser(email: String, password: String) {
        userDefaults.set(email, forKey: Constants.userEmail)
        userDefaults.set(password, forKey: Constants.userPassword)
    }
}
