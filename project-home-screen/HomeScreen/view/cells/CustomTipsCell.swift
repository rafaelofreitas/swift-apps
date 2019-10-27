//
//  CustomChartCell.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class CustomTipsCell: UITableViewCell {
    var tip: Tips?
    var items: [TipsItem] = []
    
    var cardView: CardView = {
        var card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return card
    }()
    
    var verticalScrollView: VerticalScroll = {
        var verticalScroll = VerticalScroll()
        
        return verticalScroll
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        if let tip = tip {
            items = tip.tipsItem
        }
        
        self.addSubview(cardView)
        self.cardView.addSubview(verticalScrollView)
        verticalScrollView.addLabel(items)
        
        let constraints = [
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 300),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            verticalScrollView.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            verticalScrollView.heightAnchor.constraint(equalToConstant: 300),
            verticalScrollView.leftAnchor.constraint(equalTo: self.cardView.leftAnchor, constant: 20),
            verticalScrollView.rightAnchor.constraint(equalTo: self.cardView.rightAnchor, constant: -20),
            verticalScrollView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
