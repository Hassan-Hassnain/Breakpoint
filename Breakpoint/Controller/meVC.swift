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
    
    @IBAction func signOutButtonWasPressed(_ sender: Any) {
        
        
        //this is not tutorial code
        do {
            try Auth.auth().signOut()
            print("Signed out")
        } catch {
            print("Signed out")
        }
        
        let authVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AuthVC")
        
        self.present(authVC, animated: true, completion: nil)
    }
    
    
}
