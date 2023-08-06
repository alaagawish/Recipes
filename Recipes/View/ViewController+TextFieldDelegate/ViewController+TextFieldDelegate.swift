//
//  ViewController+TextFieldDelegate.swift
//  Recipes
//
//  Created by Alaa on 06/08/2023.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
