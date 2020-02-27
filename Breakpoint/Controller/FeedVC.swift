//
//  FirstViewController.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/23/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessage { (messageArray) in
            self.messages = messageArray.reversed()
            self.tableView.reloadData()
        }
    }


}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else {return FeedCell()}
        let message = messages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (returenedName) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: returenedName, content: message.content)
        }
        return cell
    }
    
    
}

