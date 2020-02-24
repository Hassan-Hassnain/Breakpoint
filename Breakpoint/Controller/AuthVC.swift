//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signInWithFacebookButtonWasPressed(_ sender: Any) {
    }
    @IBAction func signInWithGoogleButtonWasPressed(_ sender: Any) {
    }
    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginVC = (storyboard?.instantiateViewController(withIdentifier: "LoginVC"))!
        present(loginVC, animated: true, completion: nil)
    }
    


}
