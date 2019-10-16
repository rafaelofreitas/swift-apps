//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Rafael Freitas on 15/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage : ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIcoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIcoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIcoming {
                 leadingConstraint.isActive = true
                 trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        addSubview(messageLabel)
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(constraints)
        

        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
       
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
