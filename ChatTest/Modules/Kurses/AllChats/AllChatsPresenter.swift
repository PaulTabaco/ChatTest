//
//  AllChatsPresenter.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AllChatsPresenter {
    var networking: Networking
    
    init(networking: Networking = Networking()) {
        self.networking = networking
    }
    
    func getAndshowData(view: AllChatsViewController) {
        
        networking.getChannels() { (channels) in
            guard let channels = channels else {
                view.showError(with: Globals.Errors.noConnection)
                return
            }
            view.show(channels: channels)
        }
    }
    
}

