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
    
    let messagesFromServer = [
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat  sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: false, date: Date.customFromString("10/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet.", isIcoming: true, date: Date.customFromString("01/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin. Duis lobortis, diam commodo efficitur viverra, est urna venenatis augue, eget viverra est nisl id lectus. Suspendisse facilisis rhoncus elit sit amet commodo.", isIcoming: true, date: Date.customFromString("02/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: false, date: Date.customFromString("03/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: false, date: Date.customFromString("03/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("04/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat  sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("04/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("05/01/2019")),
            ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquam feugiat  sapien et dignissim. Suspendisse congue enim quis mi ornare sollicitudin.", isIcoming: true, date: Date.customFromString("05/01/2019"))
    ]
    
    fileprivate func attempToAssembleGroupedMessages () {
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (Key) in
            let values = groupedMessages[Key]
            chatMessages.append(values ?? [])
        }
    }
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        attempToAssembleGroupedMessages ()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let width = originalContentSize.width + 20
            let height = originalContentSize.height + 10
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            
            return CGSize(width: width, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = DateHeaderLabel()
        
        if let fistMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: fistMessageInSection.date)

            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 53
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
