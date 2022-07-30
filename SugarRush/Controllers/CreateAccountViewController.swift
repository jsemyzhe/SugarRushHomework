//
//  CreateAccountViewController.swift
//  SugarRush
//
//  Created by Julia Semyzhenko on 3/11/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Vector")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Vector")
    }
    
    @IBAction func sighUpPressed(_ sender: UIButton) {
        if checkFields() == 5 {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToEmtyHomeScreen") {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    // MARK: - Textfield Operations
    func checkFields() -> Int {
        var count = 0
        if SharedClass.sharedInstance.isValidName(name: fullNameTextfield.text!) == false {
            makeAnAlert("Invalid name")
        } else { count += 1 }
        if SharedClass.sharedInstance.isValidPhoneNumber(number: phoneNumberTextField.text!) == false {
            makeAnAlert("Invalid phone number")
        } else { count += 1 }
        if SharedClass.sharedInstance.isValidEmail(email: emailTextfield.text!) == false {
            makeAnAlert("Invalid email address")
        } else { count += 1 }
        if SharedClass.sharedInstance.isValidPassword(password: passwordTextField.text!) == false {
            makeAnAlert("Invalid password")
        } else { count += 1 }
        if passwordTextField.text != confirmPasswordTextField.text {
            makeAnAlert("Password doesn't match")
        } else { count += 1 }
     
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
    
    @IBAction func passwordSecureText(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func confirmPasswordSecureText(_ sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry = !confirmPasswordTextField.isSecureTextEntry
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()

        backItem.title = ""
        backItem.tintColor = UIColor(red: 200, green: 200, blue: 200, alpha: 1)
        navigationItem.backBarButtonItem = backItem
    }
}
