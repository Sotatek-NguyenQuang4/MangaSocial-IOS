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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addPadding(.left(15))
        passwordTextField.addPadding(.left(15))
        passwordTextField.enablePasswordToggle()
        checkValidate()
        
        hideKeyboardWhenTappedAround()
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
            // success
            case .success(let success):
                guard let user = success.account else {
                    self.view.makeToast(success.message, position: .top)
                    return
                }
                AppConstant.saveUser(model: user)
                self.navigationController?.setRootViewController(viewController: MainTabBarController(),
                                                                 controllerType: MainTabBarController.self)
            // failure
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
        // Kiểm tra email có đúng định dạng không
        // ! là trường hợp ngược lại
        if !email.isValidEmail {
            isEmail = false
        } else {
            isEmail = true
        }
        // Kiểm tra password có đúng định dạng không
        // ! là trường hợp ngược lại
        if !password.isValidPassword {
            isPassword = false
        } else {
            isPassword = true
        }
        // Nếu cả email và isPassword đều phải đúng định dạng mới sáng nút button login
        // isUserInteractionEnabled: Tắt/Bật action của button
        if isEmail && isPassword {
            loginButton.isUserInteractionEnabled = true
            loginButton.backgroundColor = R.color.mainOrange.callAsFunction()
        } else {
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = R.color.mainDisable.callAsFunction()
        }
    }
    
    @IBAction func actionForgot(_ sender: Any) {
        
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
