//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Rafael Freitas on 15/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIcoming: Bool
    let date: Date
}

extension Date {
    static func customFromString(_ customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {

    fileprivate let cellId = "id123"
    
    let chatMessages = [
        [
            ChatMessage(text: "Lorem ipsum dolor sit amet.", isIcoming: true, date: Date.customFromString("01/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin. Duis lobortis, diam commodo efficitur viverra, est urna venenatis augue, eget viverra est nisl id lectus. Suspendisse facilisis rhoncus elit sit amet commodo.", isIcoming: true, date: Date.customFromString("02/01/2019"))
        ],
        [
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: false, date: Date.customFromString("03/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: false, date: Date.customFromString("03/01/2019"))
        ],
        [
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("04/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat  sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("04/01/2019"))
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let fistMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: fistMessageInSection.date)
            
            return dateString
        }
        
        return "Sections: \(Date())"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
        cell.chatMessage = chatMessage
        
        return cell
    }
}
