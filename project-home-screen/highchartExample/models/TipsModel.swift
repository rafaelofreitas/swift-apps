//
//  ChartModel.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation

class TipsModel: Component{
    let tipsItem : [TipsItemModel]
    
    init(tipsItem: [TipsItemModel]) {
        self.tipsItem = tipsItem
        super.init(type: ComponentType.TIPS)
    }
}
