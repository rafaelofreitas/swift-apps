//
//  VerticalScroll.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class VerticalScroll: UIView, UIScrollViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    func addLabel(_ items: [TipsItem]) {
        for element in scrollView.subviews {
            element.removeFromSuperview()
        }
        
        var auxTopAnchor = scrollView.topAnchor
    
        if (items.isEmpty) {
            return
        }else {
            for i in items.indices {
                 createChip(i, &auxTopAnchor, items)
            }
        }
    }
       
    func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
           
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scrollView.delegate = self
    }
    
    fileprivate func createChip(_ i: Int, _ auxTopAnchor: inout NSLayoutYAxisAnchor, _ items: [TipsItem]) {
        let component = ViewIntoVerticalScroll()
        component.decriptionLabel.text = items[i].title
        component.imageLabelView.image = UIImage(named: items[i].image)
        scrollView.addSubview(component)
        
        if i == 0 {
            component.topAnchor.constraint(equalTo: auxTopAnchor, constant: 10).isActive = true
        } else {
            component.topAnchor.constraint(equalTo: auxTopAnchor, constant: 70).isActive = true
        }
        
        if i == items.count - 1 {
            component.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -12).isActive = true
        }
        
        component.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        component.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        auxTopAnchor = component.bottomAnchor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
