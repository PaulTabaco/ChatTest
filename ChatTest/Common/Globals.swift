//
//  Globals.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

struct Globals {
    
    struct CellNames {
        static let allChatsTableViewCell = "AllChatsTableViewCell"
    }
    struct Sizes {
        static let cellHeight: CGFloat = 70.0
    }
    struct API {
        static let baseUrl = "http://ec2-34-211-67-136.us-west-2.compute.amazonaws.com/"
        static let chanels = "api/chat/channels/"
        static let messages = "messages"
    }
    struct ViewControllerNames {
        static let oneChatViewController = "OneChatViewController"
    }
    struct Dates {
        static let DayAndTime = "dd:MM"
        static let DateFromServer = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
    struct Defaults{
        static let defaultUserPicName = "defaultUserPic"
    }
    struct Errors {
        static let noConnection = "No connection"
    }
    
    
}
