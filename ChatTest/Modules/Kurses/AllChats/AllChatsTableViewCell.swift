//
//  AllChatsTableViewCell.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit
import AlamofireImage

class AllChatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPicImage: UIImageView!
    @IBOutlet weak var userFullNameLabel: UILabel!
    @IBOutlet weak var lastMessageBodyLabel: UILabel!
    @IBOutlet weak var messageDateLabel: UILabel!
    @IBOutlet weak var badgeBackgroundView: UIView!
    @IBOutlet weak var unreadedCounterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userPicImage.circularImage()
        badgeBackgroundView.layer.cornerRadius = badgeBackgroundView.layer.frame.height/2
    }

    func fillwithData (channel: Channel?) {
        setImage(path: "\(channel?.message?.sender.photo ?? "")\(String(describing: channel?.message?.sender.userID))")
        setBudge(unreadMessages: channel?.unreadMessagesCount)
        userFullNameLabel.text = "\(channel?.message?.sender.firstName ?? "") \(channel?.message?.sender.lastName ?? "")"
        lastMessageBodyLabel.text = channel?.message?.messageText
        messageDateLabel.text = Date.from(channel?.message?.createDate)?.getDayAndTime()
        
    }
    
    private func setImage(path: String?)  {
        if let imageUrlString = path, let imageUrl = URL(string: (imageUrlString)) {
            let placeholderImage = UIImage(named: Globals.Defaults.defaultUserPicName)!
            userPicImage.af_setImage(withURL: imageUrl, placeholderImage: placeholderImage)
        }
    }
    private func setBudge(unreadMessages: Int?){
        if let unreadMessagesCounter = unreadMessages, unreadMessagesCounter > 0 {
            unreadedCounterLabel.isHidden = false
            badgeBackgroundView.isHidden = false
        unreadedCounterLabel.text = String(describing: unreadMessagesCounter)
        }
        else {
            unreadedCounterLabel.isHidden = true
            badgeBackgroundView.isHidden = true
            unreadedCounterLabel.text = ""
        }
        
    }
    
}
