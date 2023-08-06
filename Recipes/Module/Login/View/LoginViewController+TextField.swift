//
//  LoginViewController+TextField.swift
//  Recipes
//
//  Created by Alaa on 05/08/2023.
//

import UIKit

extension LoginViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let _ = textField.text {
            checkValidations()
        }
    }
    
    func checkValidations() {
        if emailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            loginButton.isEnabled = false
        }else {
            loginButton.isEnabled = true
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if  textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }else {
            logIn()
        }
        return true
    }
    
}
