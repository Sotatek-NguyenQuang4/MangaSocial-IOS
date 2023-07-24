//
//  UIViewController+Extentsion.swift
//  MangaSocial
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String?,
                            message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true)
    }
    
    func presentSimpleAlert(title: String?,
                            message: String,
                            callback: @escaping () -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in callback()}))
        present(alert, animated: true)
    }
    
    func presentConfirmationAlert(title: String? = nil,
                                  message: String,
                                  okOption: String, cancelOption: String,
                                  okCallback: @escaping () -> Void,
                                  cancelCallback: @escaping () -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okOption,
                                      style: .default,
                                      handler: { _ in
            okCallback()
        }))
        alert.addAction(UIAlertAction(title: cancelOption,
                                      style: .cancel,
                                      handler: { _ in
            cancelCallback()
        }))
        present(alert, animated: true)
    }
    
    func showAlert(title: String,
                   message: String,
                   textOk: String,
                   okCallBack: @escaping() -> Void) {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: textOk,
                                     style: .default,
                                     handler: { _ in
            okCallBack()
        })
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
