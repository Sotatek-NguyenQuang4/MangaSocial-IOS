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
        AppConstant.accessToken = nil
        AppConstant.userId = nil
        self.navigationController?.setRootViewController(viewController: LoginViewController(),
                                                         controllerType: LoginViewController.self)
    }
}
