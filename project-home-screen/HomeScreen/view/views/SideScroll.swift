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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func addLabel(cardsChart: [CardChart]) {
        for element in categoryScrollView.subviews {
            element.removeFromSuperview()
        }
        
        var auxLeftAnchor = categoryScrollView.leftAnchor

        if (!cardsChart.isEmpty) {
            for i in cardsChart.indices {
                 createChip(i, &auxLeftAnchor, cardsChart)
            }
        }
    }
       
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
           
        addSubview(categoryScrollView)
        
        categoryScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryScrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        categoryScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        categoryScrollView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        categoryScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        categoryScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = -2
        }
    }
    
    fileprivate func createChip(_ i: Int, _ auxLeftAnchor: inout NSLayoutXAxisAnchor, _ cardChart: [CardChart]) {
        let component = ViewIntoSideScroll()
        component.chartView.options = cardChart[i].options
        categoryScrollView.addSubview(component)
        
        component.centerYAnchor.constraint(equalTo: categoryScrollView.centerYAnchor).isActive = true
        
        if i == 0 {
            component.leftAnchor.constraint(equalTo: auxLeftAnchor, constant: 12).isActive = true
        } else {
            component.leftAnchor.constraint(equalTo: auxLeftAnchor, constant: 250).isActive = true
        }
        
        if i == cardChart.count - 1 {
            component.rightAnchor.constraint(equalTo: categoryScrollView.rightAnchor, constant: -240).isActive = true
        }
        
        auxLeftAnchor = component.rightAnchor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
