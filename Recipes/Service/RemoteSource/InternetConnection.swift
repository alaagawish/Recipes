//
//  InternetConnection.swift
//  Recipes
//
//  Created by Alaa on 06/08/2023.
//

import Foundation
import Reachability

class InternetConnection {
    
    static let sharedInstance = InternetConnection()
    
    var reachability: Reachability? {
        do {
            return try Reachability()
        } catch {
            print("Unable to create Reachability")
            return nil
        }
    }
    
    func isConnectedToInternet() -> Bool {
      
        return  reachability?.connection != .unavailable
    }
    
    private init() {
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}


