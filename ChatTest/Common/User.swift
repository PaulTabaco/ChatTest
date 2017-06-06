//
//  User.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class User {
    var lastName: String?
    var firstName: String?
    var userID: Int
    var photo: String?
    var userName: String?
    
    init(lastName: String? = nil, firstName: String? = nil, userID: Int, photo: String? = nil, userName: String? = nil) {
        self.lastName = lastName
        self.firstName = firstName
        self.userID = userID
        self.photo = photo
        self.userName = userName
    }
}
