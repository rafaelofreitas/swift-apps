//
//  CardModel.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import Highcharts

class CardChart: Component {
    let description: String
    let charType: ChartType
    let options: HIOptions?
    
    init(description: String, charType: ChartType, options: HIOptions) {
        self.description = description
        self.charType = charType
        self.options = options
        super.init(type: ComponentType.CARD)
    }
}
