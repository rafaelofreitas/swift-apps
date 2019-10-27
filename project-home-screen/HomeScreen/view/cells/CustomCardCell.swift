//
//  CustomCardCell.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit
import Highcharts

class CustomCardCell: UITableViewCell {
    var chart: CardChart?
    
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
    
    var chartView: HIChartView = {
        let chartView = HIChartView()
        chartView.backgroundColor = UIColor.white
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = .white
        return chartView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
        
    func setupView() {
        self.addSubview(cardView)
        self.cardView.addSubview(chartView)
        
        dataSubviews()

        let constraints = [
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 230),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            chartView.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 5),
            chartView.rightAnchor.constraint(equalTo: self.cardView.rightAnchor),
            chartView.leftAnchor.constraint(equalTo: self.cardView.leftAnchor),
            chartView.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor),
            chartView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -5),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
        
    func dataSubviews() {
        if chart != nil {
            chartView.options = chart?.options
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
