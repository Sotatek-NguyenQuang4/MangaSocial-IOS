//
//  HomeViewController.swift
//  MangaSocial
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showCustomeIndicator()
        HomeAPI.shared.getLovehistory(page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print("sai:\(error)")
            }
            self.hideCustomeIndicator()
        }
    }
}
