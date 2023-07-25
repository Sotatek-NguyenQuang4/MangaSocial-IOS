//
//  LoginViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 24/07/2023.
//

import UIKit

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
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
    }
    
    @IBAction func actionForgot(_ sender: Any) {
        
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

struct LoginModel: Codable {
    let account: Account?
    let message: String
}
struct Account: Codable {
    let email: String
    let id_user: Int
    let jwt: String
    let password: String
}
