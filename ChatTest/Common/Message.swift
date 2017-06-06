//
//  Message.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class Message {
    var sender: User
    var createDate: String
    var messageText: String
    var isRead: Bool
    
    init(sender: User, createDate: String, messageText: String, isRead: Bool) {
        self.sender = sender
        self.createDate = createDate
        self.messageText = messageText
        self.isRead = isRead
    }
}
