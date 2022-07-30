//
//  LoginViewController.swift
//  SugarRush
//
//  Created by Julia Semyzhenko on 3/8/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Vector")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Vector")
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if checkFields() == 2  {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToEmtyHomeScreen") {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    // MARK: - Textfield Operations
    @IBAction func passwordSecureText(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    func checkFields() -> Int {
        var count = 0
        if SharedClass.sharedInstance.isValidEmail(email: emailTextfield.text!) == false {
            makeAnAlert("Invalid email address")
        } else {
            count +=  1
        }
        if SharedClass.sharedInstance.isValidPassword(password: passwordTextField.text!) == false {
            makeAnAlert("Invalid password")
        } else {
            count += 1
        }
        return count
    }
    
    func  makeAnAlert(_ message: String) {
        let alert = UIAlertController(title: "Ooops!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        backItem.tintColor = UIColor(red: 200, green: 200, blue: 200, alpha: 1)
        navigationItem.backBarButtonItem = backItem
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
}

