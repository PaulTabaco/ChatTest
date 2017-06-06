//
//  Networking.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    
    func getChannels (completion: @escaping ([Channel]?) -> Void) {
        let tempUrl = "\(Globals.API.baseUrl)\(Globals.API.chanels)"
        Alamofire.request(tempUrl).responseJSON { response in
            if let result = response.result.value as? [String: AnyObject], let json_channels = result["channels"] as? [Dictionary <String, AnyObject>] {
                var channels = [Channel]()
                for json_channel in json_channels {
                    if let id = (json_channel["id"] as? Int), let unreadMessagesCount = json_channel["unread_messages_count"] as? Int, let users = self.extractUsers(json_users: json_channel["users"]) {
                        
                        let lastMessage = self.extractMessage(json_message: json_channel["last_message"] )
                        
                        let channel = Channel(users: users, message: lastMessage, id: id, unreadMessagesCount: unreadMessagesCount)
                        channels.append(channel)
                    }
                }
                if !channels.isEmpty {
                    completion(channels)
                }
                else {
                    completion(nil)
                }
            }
        }
    }
    
    private func extractUsers(json_users: AnyObject?) -> [User]? {
        var users = [User]()
        if let jsonUsers = json_users as? [Dictionary <String, AnyObject>] {
            for jsonUser in jsonUsers {
                if let user2 = extractUser(json_user: jsonUser) {
                    users.append(user2)
                }
            }
        }
        return !users.isEmpty ? users : nil
    }
    
    private func extractUser (json_user: Dictionary <String, AnyObject>) -> User? {
        if let userID = json_user["id"] as? Int {
            let lastName = json_user["last_name"] as? String
            let photoString = json_user["photo"] as? String
            let username = json_user["username"] as? String
            let first_name = json_user["first_name"] as? String
            return User(lastName: lastName, firstName: first_name, userID: userID, photo: photoString, userName: username)
        } else {
            return nil
        }
    }
    
    private func extractMessage(json_message: AnyObject?) -> Message? {
        if let message = json_message as? Dictionary <String, AnyObject>,
            let messageCreateDate = message["create_date"] as? String,
            let messageText = message["text"] as? String,
            let messageIsRead = message["is_read"] as? Bool,
            let senderMessage = message["sender"] as? Dictionary <String, AnyObject>,
            let sender = self.extractUser(json_user: senderMessage) {
                return Message(sender: sender, createDate: messageCreateDate, messageText: messageText, isRead: messageIsRead)
        } else {
            return nil
        }
    }

}
