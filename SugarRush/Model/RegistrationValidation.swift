//
//  RegistrationValidation.swift
//  SugarRush
//
//  Created by Julia Semyzhenko on 7/29/22.
//

import Foundation

class SharedClass: NSObject {
    
    static let sharedInstance = SharedClass()
    func isValidName(name: String) -> Bool {
        let nameRegex = "[A-Za-z]{2,10}"
        var valid = NSPredicate(format: "SELF MATCHES %@", nameRegex).evaluate(with: name)
        if valid {
            valid = !name.contains("Invalid names")
        }
        return valid
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        var valid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        if valid {
            valid = !email.contains("Invalid email id")
        }
        return valid
    }
    
    func isValidPhoneNumber(number: String) -> Bool {
        let phoneNumbertRegex = "^\\d{10}$"
        var valid = NSPredicate(format: "SELF MATCHES %@", phoneNumbertRegex).evaluate(with: number)
        if valid {
            valid = !number.contains("Invalid number")
        }
        return valid
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "[A-Z0-9a-z]{6,10}"
        var valid = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        if valid {
            valid = !password.contains("Invalid password")
        }
        return valid
    }
    
    private override init() {
        
    }
}


