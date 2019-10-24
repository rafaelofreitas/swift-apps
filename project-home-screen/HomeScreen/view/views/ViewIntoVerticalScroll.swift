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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
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
    
    func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cardView)
        cardView.addSubview(imageLabelView)
        cardView.addSubview(decriptionLabel)
        
        cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        imageLabelView.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 5).isActive = true
        imageLabelView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageLabelView.leftAnchor.constraint(equalTo: self.cardView.leftAnchor, constant: 10).isActive = true
        imageLabelView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -5).isActive = true
        
        decriptionLabel.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 5).isActive = true
        decriptionLabel.leftAnchor.constraint(equalTo: self.imageLabelView.rightAnchor, constant: 15).isActive = true
        decriptionLabel.rightAnchor.constraint(equalTo: self.cardView.rightAnchor, constant: -5).isActive = true
        decriptionLabel.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
