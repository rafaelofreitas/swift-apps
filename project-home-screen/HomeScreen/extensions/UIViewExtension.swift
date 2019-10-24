//
//  UIViewExtension.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func cardLines(_ round:Int = 0,bottomRight:Bool = true,bottomLeft:Bool = true ,topRight:Bool = true ,topLeft:Bool = true,linecolor:UIColor = UIColor.gray,linesize:CGFloat = 0.3){
        self.layer.cornerRadius = CGFloat(round)
        self.layer.masksToBounds = false
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        var format=CACornerMask()
        
        if bottomRight && bottomLeft && topRight && topLeft {
            format = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        }else {
            if bottomRight {
                format.insert(.layerMaxXMaxYCorner)
            }
            
            if bottomLeft {
                format.insert(.layerMinXMaxYCorner)
            }
            
            if topRight {
                format.insert(.layerMaxXMinYCorner)
            }
            
            if topLeft {
                format.insert(.layerMinXMinYCorner)
            }
        }
        
        self.layer.maskedCorners = format
        self.layer.borderWidth = linesize
        self.layer.borderColor = linecolor.cgColor
    }
    
    func elevante (_ cornerRadius:CGFloat = 8, color:UIColor = .white){
        let shadowOffsetWidth: Int = 2
        let shadowOffsetHeight: Int = 2
        let shadowColor: UIColor? = UIColor.black
        let shadowOpacity: Float = 0.2
        
        self.layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor?.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
    }
}
