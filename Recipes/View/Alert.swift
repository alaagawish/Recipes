//
//  Alert.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import Foundation
import UIKit

class Alert{
    
    func showRemoveItemFromFavoritesAlert(title: String, msg: String, yesHandler:@escaping (UIAlertAction)->())-> UIAlertController{
        let alert : UIAlertController = UIAlertController(title: title, message:msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.yes, style: .destructive, handler: yesHandler))
        alert.addAction(UIAlertAction(title: Constants.cancel, style: .cancel, handler: nil))
        return alert
    }
    
    func errorAlert(title: String, msg: String, positiveHandler:((UIAlertAction)->())? = nil)-> UIAlertController{
        let alert : UIAlertController = UIAlertController(title: title, message:msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: .default, handler: positiveHandler))
        return alert
    }
}

