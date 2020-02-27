//
//  CreateGroupsVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/27/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func cancelButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? userCell else {return userCell()}
        
        cell.configure(profileImage: UIImage(named: "defaultProfileImage")!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    
    
    
    
}

extension CreateGroupsVC: UITextFieldDelegate {
    
}
