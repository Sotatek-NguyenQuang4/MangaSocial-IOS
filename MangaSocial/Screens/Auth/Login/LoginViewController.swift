//
//  LoginViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 24/07/2023.
//

import UIKit
import Toast_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addPadding(.left(15))
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Enteryour email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(hexString: "#7D7C7C")])
        
        passwordTextField.addPadding(.left(15))
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(hexString: "#7D7C7C")])
        passwordTextField.enablePasswordToggle()
        
        emailTextField.text = "diem4639@gmail.com"
        passwordTextField.text = "Diem6789"
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        
        showLoginIndicator()
        LoginAPI.shared.login(email: email,
                              password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            // success
            case .success(let success):
                guard let user = success.account else { return }
                AppConstant.saveUser(model: user)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.navigationController?.setRootViewController(viewController: MainTabBarController(),
                                                                     controllerType: MainTabBarController.self)
                })

            // failure
            case .failure(let failure):
                self.view.makeToast(failure.message)
            }
            self.hideCustomeIndicator()
        }
    }
    
    @IBAction func actionForgot(_ sender: Any) {
        
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
