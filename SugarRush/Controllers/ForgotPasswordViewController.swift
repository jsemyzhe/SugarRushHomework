//
//  ForgotPasswordViewController.swift
//  SugarRush
//
//  Created by Julia Semyzhenko on 3/11/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func continuePressed(_ sender: UIButton) {
        if SharedClass.sharedInstance.isValidEmail(email: emailTextField.text!) == false {
            let alert = UIAlertController(title: "Ooops!", message: "Invalid email address", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in })
            alert.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }
    }
}
