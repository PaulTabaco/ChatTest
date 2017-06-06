//
//  AllChatsViewController.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AllChatsViewController: UIViewController {
    
    var channels: [Channel]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func getData() {
        let presenter = AllChatsPresenter()
        presenter.getAndshowData(view: self)
    }
    
    func show(channels: [Channel]) {
        self.channels = channels
        tableView.reloadData()
    }
    
}

extension AllChatsViewController: AllViewsProtocol {
    
    func showError(with description: String){
        print ("Show Error Alert there\n with message: \(description)")
    }
    
}

extension AllChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let id = channels?[indexPath.row].id {
            moveToSelectedChannel(destinationStr: Globals.ViewControllerNames.oneChatViewController, id: id)
        }
    }
    
    private func moveToSelectedChannel(destinationStr: String, id: Int) {
        let oneChatViewController = OneChatViewController.storyboardInstance()
        oneChatViewController.chatID = id
        self.navigationController?.pushViewController(oneChatViewController, animated: true)
    }
    
}

extension AllChatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Globals.Sizes.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Globals.CellNames.allChatsTableViewCell) as? AllChatsTableViewCell  else {
            return UITableViewCell()
        }
        cell.fillwithData(channel: channels?[indexPath.row])
        return cell
    }
    
}
