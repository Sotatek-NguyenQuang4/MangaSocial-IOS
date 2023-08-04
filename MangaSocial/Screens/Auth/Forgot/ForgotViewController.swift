//
//  ForgotViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import UIKit
import Toast_Swift

class ForgotViewController: BaseViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var errorEmailView: UIView!
    @IBOutlet weak var loginContinueButton: UIButton!
    
    @IBAction func actionBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        hideNavigationBar()
        hideKeyboardWhenTappedAround()
        
        checkvalidate()
        showErrorValidate()
    }
    
    @IBAction func actionContinueButton(_ sender: Any) {
        let email = emailTextfield.text.asStringOrEmpty()
        
        ForgotAPI.shared.forgot(email: email,
                                password: "Diem6789",
                                confirmpassword: "Diem6789") { result in
            switch  result {
            case .success( let success ):
                self.view.makeToast(success.message , position: .bottom)
            case .failure(let error) :
                self.view.makeToast(error.message, position: .bottom)
            }
        }
    }
    
    @IBAction func changeEmailView(_ sender: Any) {
        checkvalidate()
    }
    
    private func checkvalidate() {
        let email = emailTextfield.text.asStringOrEmpty()
        var isEmail: Bool = false
        
        if email.isValidEmail {
            isEmail = true
        } else {
            isEmail = false
        }
        
        if !isEmail && !email.isEmpty {
            errorEmailView.isHidden = false
        } else {
            errorEmailView.isHidden = true
        }
        
        if isEmail {
            loginContinueButton.isPointerInteractionEnabled = true
            loginContinueButton.backgroundColor = R.color.mainOrange.callAsFunction()
        } else {
            loginContinueButton.isPointerInteractionEnabled = false
            loginContinueButton.backgroundColor = R.color.mainDisable.callAsFunction()
        }
    }
    
    func showErrorValidate() {
        errorEmailView.isHidden = true
    }
}
