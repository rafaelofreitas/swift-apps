//
//  AjustPointSimpleView.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit
import Highcharts

class ViewIntoSideScroll : UIView {
    
    var cardView: CardView = {
        var card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return card
    }()
    
    var chartView: HIChartView = {
        let chartView = HIChartView()
        chartView.backgroundColor = UIColor.white
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return chartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        
        addSubview(cardView)
        cardView.addSubview(chartView)
        
        let constraints = [
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 230),
            cardView.heightAnchor.constraint(equalToConstant: 230),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            chartView.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            chartView.rightAnchor.constraint(equalTo: self.cardView.rightAnchor),
            chartView.leftAnchor.constraint(equalTo: self.cardView.leftAnchor),
            chartView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
