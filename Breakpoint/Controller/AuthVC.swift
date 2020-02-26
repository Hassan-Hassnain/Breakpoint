//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      checkUserSignInState()
        
    }
    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginVC = (storyboard?.instantiateViewController(withIdentifier: "LoginVC"))!
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    
    @IBAction func signInWithFacebookButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func signInWithGoogleButtonWasPressed(_ sender: Any) {
    }
    
    func checkUserSignInState() {
        if Auth.auth().currentUser != nil {
                  print("AuthVC \(String(describing: Auth.auth().currentUser))")
                  dismiss(animated: true, completion: nil)
              } else {
                  print("Currently no user signed in")
              }
    }
    
}
