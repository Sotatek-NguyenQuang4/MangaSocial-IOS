//
//  HomeViewController.swift
//  MangaSocial
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        AppConstant.logout()
        self.navigationController?.setRootViewController(viewController: LoginViewController(),
                                                         controllerType: LoginViewController.self)
    }
}
