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
    
    @IBOutlet weak var errorEmailView: UIView!
    @IBOutlet weak var errorPasswordView: UIView!
    @IBOutlet weak var errorConfirmPasswordView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        
        emailTextField.addPadding(.left(15))
        passwordTextField.addPadding(.left(15))
        confirmPasswordTextField.addPadding(.left(15))
        
        passwordTextField.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
        
        checkValidate()
        hideKeyboardWhenTappedAround()
        
        errorEmailView.isHidden = true
        errorPasswordView.isHidden = true
        errorConfirmPasswordView.isHidden = true
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
        checkValidate()
    }
    
    private  func checkValidate() {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        let confirmPassword = confirmPasswordTextField.text.asStringOrEmpty()
        
        var isEmail: Bool = false
        var isPassword: Bool = false
        var isConfirmPassword: Bool = false
        // Check thêm email.isEmpty (email phải có ít nhất 1 kí tự mới check) tương tự cho password
        if email.isValidEmail {
            isEmail = true
        } else {
            isEmail = false
        }
        
        if password.isValidPassword {
            isPassword = true
        } else {
            isPassword = false
        }
        
        if password != confirmPassword {
            isConfirmPassword = false
        } else {
            isConfirmPassword = true
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
        
        if !isConfirmPassword && !confirmPassword.isEmpty {
            errorConfirmPasswordView.isHidden = false
        } else {
            errorConfirmPasswordView.isHidden = true
        }
        
        if isEmail && isPassword && isConfirmPassword {
            loginButtonSignIn.isUserInteractionEnabled = true
            loginButtonSignIn.backgroundColor = R.color.mainOrange.callAsFunction()
        } else {
            loginButtonSignIn.isUserInteractionEnabled = false
            loginButtonSignIn.backgroundColor = R.color.mainDisable.callAsFunction()
        }
    }
    
    func showErrorValidate() {
        errorEmailView.isHidden = true

    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        let email = emailTextField.text.asStringOrEmpty()
        let password = passwordTextField.text.asStringOrEmpty()
        
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
                print(user)
                seft.navigationController?.popViewController(animated: true)
                
            case .failure(let failure):
                self?.view.makeToast(failure.message, position: .top)
            }
        }
    }
}
