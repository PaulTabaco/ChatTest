//
//  UIImageExtension.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func circularImage(){
        self.layer.frame = self.layer.frame.insetBy(dx: 0, dy: 0)
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.contentMode = UIViewContentMode.scaleAspectFill
    }
    
}
