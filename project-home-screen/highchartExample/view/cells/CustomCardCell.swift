//
//  CustomCardCell.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class CustomCardCell: UITableViewCell {
    var mainDescription: String?
    
    var cardView: CardView = {
        var card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return card
    }()
    
    var labelDescription: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = UtilsColor.hexStringToUIColor(hex: "#0C4047")
        
        return descriptionLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
        
    func setupView() {
        self.addSubview(cardView)
        cardView.addSubview(labelDescription)
        dataSubviews()

        let constraints = [
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 180),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            labelDescription.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 10),
            labelDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
        
    func dataSubviews() {
        if let mainDescription = mainDescription {
            labelDescription.text = mainDescription
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
