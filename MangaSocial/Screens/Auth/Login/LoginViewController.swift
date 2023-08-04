//
//  LoginViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 24/07/2023.
//

import UIKit
import Toast_Swift

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorEmailView: UIView!
    @IBOutlet weak var errorPasswordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addPadding(.left(15))
        passwordTextField.addPadding(.left(15))
        
        passwordTextField.enablePasswordToggle()
        hideKeyboardWhenTappedAround()
        
        checkValidate()
        showErrorValidate()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        
        showCustomeIndicator()
        LoginAPI.shared.login(email: email,
                              password: password) { [weak self] result in
            guard let self = self else { return }
            self.hideCustomeIndicator()
            switch result {
            case .success(let success):
                guard let user = success.account else {
                    self.view.makeToast(success.message, position: .top)
                    return
                }
                AppConstant.saveUser(model: user)
                self.navigationController?.setRootViewController(viewController: MainTabBarController(),
                                                                 controllerType: MainTabBarController.self)
            case .failure(let failure):
                self.view.makeToast(failure.message, position: .top)
            }
        }
    }
    
    @IBAction func changeTextEmail(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func changeTextPassword(_ sender: Any) {
        checkValidate()
    }
    
    private func checkValidate() {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        
        var isEmail: Bool = false
        var isPassword: Bool = false
        
        if !email.isValidEmail {
            isEmail = false
        } else {
            isEmail = true
        }
        
        if !password.isValidPassword {
            isPassword = false
        } else {
            isPassword = true
        }
        
        if !isEmail && !email.isEmpty {
            errorEmailView.isHidden = false
        } else {
            errorEmailView.isHidden = true
        }
        
        if !isPassword && !password.isEmpty {
            errorPasswordView.isHidden = false
        } else {
            errorPasswordView.isHidden = true
        }
        
        if isEmail && isPassword {
            loginButton.isUserInteractionEnabled = true
            loginButton.backgroundColor = R.color.mainOrange.callAsFunction()
        } else {
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = R.color.mainDisable.callAsFunction()
        }
    }
    func showErrorValidate() {
        errorEmailView.isHidden = true
        errorPasswordView.isHidden = true
    }
    
    @IBAction func actionForgot(_ sender: Any) {
        let vc = ForgotViewController(nibName: "ForgotViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
