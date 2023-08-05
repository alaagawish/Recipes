//
//  LoginViewController.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUser()
        setUpUI()
        initViews()
        
    }
    
    func setUpUI() {
        loginButton.layer.cornerRadius = 25.0
        loginButton.isEnabled = false
    }
    
    func initViews() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginViewModel = LoginViewModel()
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func login(_ sender: Any) {
        if loginViewModel.checkInformation(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") {
            
            goHome()
            
        }else {
            let alert = Alert().errorAlert(title: Constants.incorrectInformation, msg: Constants.tryAgain)
            present(alert, animated: true)
        }
        
    }
    
    func checkUser() {
        if UserDefault().getEmail() != "" {
            goHome()
        }
    }
    
    func goHome() {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: Constants.navigator) as!  NavigationController
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
}
