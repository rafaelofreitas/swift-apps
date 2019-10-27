//
//  ViewIntoVerticalScroll.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class ViewIntoVerticalScroll: UIView {
    
    var cardView: CardView = {
        var card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
        
        return card
    }()
    
    var imageLabelView: UIImageView = {
        let imageLabel = UIImageView()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return imageLabel
    }()
     
    var decriptionLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UtilsColor.hexStringToUIColor(hex: "#0C4047")
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cardView)
        cardView.addSubview(imageLabelView)
        cardView.addSubview(decriptionLabel)
    
        let constraints = [
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            cardView.heightAnchor.constraint(equalToConstant: 55),
            
            imageLabelView.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 5),
            imageLabelView.widthAnchor.constraint(equalToConstant: 50),
            imageLabelView.leftAnchor.constraint(equalTo: self.cardView.leftAnchor, constant: 10),
            imageLabelView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -5),
            
            decriptionLabel.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 5),
            decriptionLabel.leftAnchor.constraint(equalTo: self.imageLabelView.rightAnchor, constant: 15),
            decriptionLabel.rightAnchor.constraint(equalTo: self.cardView.rightAnchor, constant: -5),
            decriptionLabel.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -5)
        ]
    
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
