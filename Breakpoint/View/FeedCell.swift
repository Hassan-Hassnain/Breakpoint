//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/27/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.emailLabel.text = email
        self.contentLabel.text = content
        
    }

}
