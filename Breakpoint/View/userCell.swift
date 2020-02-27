//
//  userCell.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/28/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
    func configure(profileImage image: UIImage, email: String, isSelected: Bool ) {
        self.profileImage.image = image
        self.emailLabel.text = email
        if isSelected {
            checkImageView.isHidden = false
        } else {
            checkImageView.isHidden = true
        }
    }
}
