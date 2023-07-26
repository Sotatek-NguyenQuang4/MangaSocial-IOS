//
//  RegisterViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 25/07/2023.
//

import UIKit
import Toast_Swift

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var loginButtonSignIn: UIButton!
    @IBOutlet weak var emailCheckLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        emailCheckLabel.isHidden = true
        emailTextField.addPadding(.left(15))
        passwordTextField.addPadding(.left(15))
        confirmPasswordTextField.addPadding(.left(15))
        passwordTextField.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
        
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionPolicy(_ sender: Any) {
        
    }
    
    @IBAction func changeEmail(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func changePassword(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func changeConfirmPassword(_ sender: Any) {
        
    }
    
    private  func checkValidate() {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        
        var isEmail: Bool = false
        var isPassword: Bool = false
        
        if !email.isValidEmail {
            isEmail = false
            emailCheckLabel.isHidden = true
        } else {
            isEmail = true
            emailCheckLabel.isHidden = false
        }
        if !password.isValidPassword {
            isPassword = false
        } else {
            isPassword = true
        }
        if isEmail && isPassword {
            loginButtonSignIn.isUserInteractionEnabled = true
        } else {
            loginButtonSignIn.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        let confirmpassword = confirmPasswordTextField.text.asStringOrEmpty()
      
        if password != confirmpassword {
            self.view.makeToast("Hai mật khẩu không khớp")
        } else {
            showCustomeIndicator()
            RegisterAPI.shared.register(email: email, password: password) { [weak self] result in
                guard let seft = self else { return }
                seft.hideCustomeIndicator()
                switch result {
                case .success(let success):
                    guard let user = success.account else {
                        self?.view.makeToast(success.message, position: .top)
                        return
                    }
                    seft.navigationController?.popViewController(animated: true)
                    
                case .failure(let failure):
                    self?.view.makeToast(failure.message, position: .top)
                }
            }
        }
    }
}
