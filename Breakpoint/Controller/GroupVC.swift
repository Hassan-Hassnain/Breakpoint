//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/23/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class GroupVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
}

extension GroupVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else  {return GroupCell()}
        cell.configure(groupTitle: "group Cell", andGroupDescription: " DUMMY DESCRIPTION", forMembers: 15)
        return cell
    }
    
    
}

