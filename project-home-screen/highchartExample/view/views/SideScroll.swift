//
//  AjustPointSimpleViewBar.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class SideScroll: UIView, UIScrollViewDelegate {
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 2
    var shadowColor: UIColor? = UIColor.gray
    var shadowOpacity: Float = 0.2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func addLabel(infoLabel: [String]) {
        for element in categoryScrollView.subviews {
            element.removeFromSuperview()
        }
        
        var texts = [String]()
        var auxLeftAnchor = categoryScrollView.leftAnchor
    
        texts = infoLabel
     
        if (texts.isEmpty) {
            return
        }else {
            for i in texts.indices {
                 createChip(i, &auxLeftAnchor, texts)
            }
        }
    }
    
    var categoryScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
       
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
           
        addSubview(categoryScrollView)
        
        categoryScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryScrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        categoryScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        categoryScrollView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        categoryScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        categoryScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    fileprivate func createChip(_ i: Int, _ auxLeftAnchor: inout NSLayoutXAxisAnchor, _ text: [String]) {
        let label = ViewIntoSideScroll()
        label.hitLabel.text = text[i]
        label.decriptionLabel.text = text[i]
        categoryScrollView.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: categoryScrollView.centerYAnchor).isActive = true
        
        if i == 0 {
            label.leftAnchor.constraint(equalTo: auxLeftAnchor, constant: 12).isActive = true
        } else {
            label.leftAnchor.constraint(equalTo: auxLeftAnchor, constant: 8).isActive = true
        }
        
        if i == text.count - 1 {
            label.rightAnchor.constraint(equalTo: categoryScrollView.rightAnchor, constant: -12).isActive = true
        }
        
        auxLeftAnchor = label.rightAnchor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
