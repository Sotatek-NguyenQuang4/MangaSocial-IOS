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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        emailTextField.addPadding(.left(15))
        passwordTextField.addPadding(.left(15))
        confirmPasswordTextField.addPadding(.left(15))
        passwordTextField.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
        
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        view.makeToast("Đăng nhập thành công")
    }
    
    @IBAction func actionPolicy(_ sender: Any) {
        
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        
    }
}

struct RegisterModel : Codable {
    let account: DataRegister?
    let message: String
}

struct DataRegister : Codable {
    let email : String
}
