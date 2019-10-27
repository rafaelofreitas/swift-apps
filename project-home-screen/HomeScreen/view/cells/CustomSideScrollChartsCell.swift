//
//  CustomChartListCell.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class CustomSideScrollChartsCell: UITableViewCell {
    var sideScrollChartsModel: SideScrollChartsModel?
    
    var sideScroll: SideScroll = {
        var sideScroll = SideScroll()
        
        return sideScroll
    }()
    
    var cardView: CardView = {
        var card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return card
    }()
    
    var labelView: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UtilsColor.hexStringToUIColor(hex: "#0C4047")
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        self.addSubview(labelView)
        self.addSubview(cardView)
        self.cardView.addSubview(sideScroll)
            
        if let sideScrollChartsModel = sideScrollChartsModel {
            labelView.text = sideScrollChartsModel.title
            sideScroll.addLabel(cardsChart: sideScrollChartsModel.listChart)
        }

        let constraints = [
            labelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            labelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            labelView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            cardView.topAnchor.constraint(equalTo: self.labelView.bottomAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 240),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            sideScroll.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            sideScroll.heightAnchor.constraint(equalToConstant: 240),
            sideScroll.leftAnchor.constraint(equalTo: self.leftAnchor),
            sideScroll.rightAnchor.constraint(equalTo: self.rightAnchor),
            sideScroll.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
