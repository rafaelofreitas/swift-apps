//
//  CustomChartCell.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class CustomTipsCell: UITableViewCell {
    var mainDescription: String?
    var mainImage: String?
    var tip: TipsModel?
    var items: [TipsItemModel] = []
    
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
    
    var mainImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
        
    func setupView() {
        self.addSubview(cardView)
        
        if let tip = tip {
            items = tip.tipsItem
        }
               
        for item in items {
            var labelDescription =  UILabel()
            
            labelDescription.text = item.title
            mainImageView.image = UIImage(named: item.image)
            cardView.addSubview(labelDescription)
        }

        let constraints = [
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 30),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            labelDescription.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            labelDescription.leftAnchor.constraint(equalTo: self.cardView.leftAnchor, constant: 30),
            labelDescription.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor),
            labelDescription.centerYAnchor.constraint(equalTo: self.cardView.centerYAnchor),
            labelDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
