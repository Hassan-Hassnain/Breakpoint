//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
//        setupView()
    }
    func setupView()  {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.white.cgColor
    }

}
