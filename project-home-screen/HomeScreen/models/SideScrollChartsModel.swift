//
//  ListChartModel.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation

class SideScrollChartsModel: Component {
    let title: String
    let listChart: [CardChart]
    
    init(title: String, listChart: [CardChart]) {
        self.title = title
        self.listChart = listChart
        super.init(type: ComponentType.LISTCHART)
    }
}
