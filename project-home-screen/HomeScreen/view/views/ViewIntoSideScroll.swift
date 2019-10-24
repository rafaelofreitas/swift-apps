//
//  AjustPointSimpleView.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class ViewIntoSideScroll : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let backgroundCardView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    var hitLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
     
    var decriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
         
        return label
    }()
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        
        addSubview(backgroundCardView)
        backgroundCardView.addSubview(decriptionLabel)
        backgroundCardView.addSubview(hitLabel)
        
        backgroundCardView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        backgroundCardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        backgroundCardView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        backgroundCardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
        decriptionLabel.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 6).isActive = true
        decriptionLabel.leftAnchor.constraint(equalTo: backgroundCardView.leftAnchor, constant: 8).isActive = true
        decriptionLabel.rightAnchor.constraint(equalTo: backgroundCardView.rightAnchor, constant: -8).isActive = true
        decriptionLabel.widthAnchor.constraint(equalTo: decriptionLabel.widthAnchor).isActive = true
        
        hitLabel.topAnchor.constraint(equalTo: decriptionLabel.bottomAnchor, constant: 2).isActive = true
        hitLabel.leftAnchor.constraint(equalTo: backgroundCardView.leftAnchor, constant: 8).isActive = true
        hitLabel.rightAnchor.constraint(equalTo: backgroundCardView.rightAnchor, constant: -8).isActive = true
        hitLabel.bottomAnchor.constraint(equalTo: backgroundCardView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
