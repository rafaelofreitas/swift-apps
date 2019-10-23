//
//  TipsItem.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation

class TipsItemModel: Component{
    let title : String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
        super.init(type: ComponentType.TIPS)
    }
}
