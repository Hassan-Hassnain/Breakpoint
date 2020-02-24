//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInButtonWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!) { (success, registrationError) in
                    if success{
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!) { (success, nil) in
                            print("Successfully registered user")
                            self.dismiss(animated: true, completion: nil)
                        }
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                }
            }
        }
    }
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
