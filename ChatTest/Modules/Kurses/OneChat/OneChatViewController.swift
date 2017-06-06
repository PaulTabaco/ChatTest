//
//  OneChatViewController.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class OneChatViewController: UIViewController {
    
    var chatID:Int?

    @IBOutlet weak var chatIDShowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FIXME: - Temporary
        if let chatID = chatID {
            chatIDShowLabel.text = String(describing: chatID)
        }
    }

}
