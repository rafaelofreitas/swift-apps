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
    let listChart: [ChartModel]
    
    init(title: String, listChart: [ChartModel]) {
        self.title = title
        self.listChart = listChart
        super.init(type: ComponentType.LISTCHART)
    }
}
