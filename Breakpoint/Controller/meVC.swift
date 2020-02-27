//
//  meVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/26/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase


class meVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
     override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           emailLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutButtonWasPressed(_ sender: Any) {
        
        let logOutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AuthVC")
                authVC.modalPresentationStyle = .fullScreen
                self.present(authVC, animated: true, completion: nil)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        logOutPopup.addAction(logoutAction)
        present(logOutPopup, animated: true, completion: nil)
        
    }
    
    
}
