//
//  HomeViewController.swift
//  MangaSocial
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.mainOrange.callAsFunction()
        
        HomeAPI.shared.getLovehistory(page: 1) { result in
            switch result {
            case .success(let success):
                let data = success.flatMap { $0 }
                print(data)
            case .failure:
                print("sai")
            }
        }
        
        guard let imageData = R.image.imgLoginBg.callAsFunction()?.jpegData(compressionQuality: 1.0) else {
            return
        }
        HomeAPI.shared.uploadImage(key: "fd81b5da86e162ade162a05220c0eb89", 
                                   name: "image", 
                                   imageData: imageData) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print("sai:\(error)")
            }
        }
    }
}
