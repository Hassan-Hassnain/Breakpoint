//
//  CreateGroupsVC.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/27/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    var chosenArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
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
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIds(forUsernames: chosenArray) { (idsArray) in
                var userIds = idsArray
                userIds.append(Auth.auth().currentUser!.uid)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userIds) { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Group could not be created. Please try again.")
                    }
                }
            }
        }
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
        
        if chosenArray.contains(emailArray[indexPath.row]) {
            cell.configure(profileImage: UIImage(named: "defaultProfileImage")!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configure(profileImage: UIImage(named: "defaultProfileImage")!, email: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? userCell else {return}
        if !(chosenArray.contains(cell.emailLabel.text!)){
            chosenArray.append(cell.emailLabel.text!)
            groupMemberLabel.text = chosenArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            chosenArray = chosenArray.filter({ $0 != cell.emailLabel.text!})
            if chosenArray.count >= 1 {
                groupMemberLabel.text = chosenArray.joined(separator: ", ")
            } else {
                groupMemberLabel.text = "add people to your group"
                doneButton.isHidden = true
            }
        }
    }
    
    
}

extension CreateGroupsVC: UITextFieldDelegate {
    
}
