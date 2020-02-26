//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInButtonWasPressed(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            login(withEmail: email, andPassword: password) { (success) in
                if !success {
                    print("Trying to register user ")
                    self.register(withEmail: email, andPassword: password)
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


extension LoginVC {
    
    func login(withEmail email: String, andPassword password: String, onCompletion: @escaping (_ success: Bool) -> ()) {
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, loginError) in
            if success {
                print("User signed in successfully with email \(Auth.auth().currentUser!)")
                onCompletion(true)
                self.dismiss(animated: true, completion: nil)
            } else {
                print("No user exist with email \(email)")
                onCompletion(false)
            }
        }
    }
    
    func register(withEmail email: String, andPassword password: String) {
        
        AuthService.instance.registerUser(withEmail: email, andPassword: password) { (success, RegistrationError) in
            if success {
                
                print("User register successfully")
                self.login(withEmail: email, andPassword: password) { (success) in
                    if success {
                        print("User login successfully")
                    }
                }
            }
        }
        
    }
    
    func oldFunction() {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    
    /*
    
    if emailField.text != nil && passwordField.text != nil {
        AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(String(describing: loginError?.localizedDescription))
                print("LoginVC loginUser Function")
            }
            AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!) { (success, registrationError) in
                if success{
                    AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!) { (success, nil) in
                        print("Successfully registered user")
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    print(String(describing: registrationError?.localizedDescription))
                    print("LoginVC registerUser Function")
                }
            }
        }
    }
    
    */
    
    
}
