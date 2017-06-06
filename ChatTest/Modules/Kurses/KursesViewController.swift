//
//  KursesViewController.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class KursesViewController: UIViewController {

    @IBAction func showChatsButtonAction(_ sender: Any) {
        let allChatsViewController = AllChatsViewController.storyboardInstance()
        self.navigationController?.pushViewController(allChatsViewController, animated: true)
    }

}
