//
//  ForgotViewController.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import UIKit

class ForgotViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBAction func actionBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionContinueButton(_ sender: Any) {
        
    }
}
