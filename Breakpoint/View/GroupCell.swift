//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/28/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    
    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupMembers: UILabel!
    
 

    func configure(groupTitle title: String, andGroupDescription description: String, forMembers memberCount: Int){
        self.groupTitle.text = title
        self.groupDescription.text = description
        self.groupMembers.text = "\(memberCount) members."
    }
}
