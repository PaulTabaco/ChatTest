//
//  Channel.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class Channel {
    var users: [User]
    var message: Message?
    var id: Int
    var unreadMessagesCount: Int
    
    init(users: [User], message: Message? = nil, id: Int, unreadMessagesCount: Int) {
        self.users = users
        self.message = message
        self.id = id
        self.unreadMessagesCount = unreadMessagesCount
    }
}
