//
//  ViewController.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit
import Highcharts

class ViewController: UIViewController, UITableViewDelegate {
    var data = [Component]()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.alwaysBounceVertical = true
        tableView.alwaysBounceHorizontal = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        let chartColumn = setupDataChartColumn("FATURAMENTO X META")
        let chartFunnel = setupDataChartFunnel("PONTO DE EQUILÍBRIO")
        
        data = [
            CardChart.init(description: "FATURAMENTO X META", charType: .COLUMN, options: chartColumn),
            CardChart.init(description: "PONTO DE EQUILÍBRIO", charType: .FUNNEL, options: chartFunnel),
            SideScrollChartsModel.init(title: "PERGUNTAS MAIS ACESSADAS", listChart:[
                    CardChart.init(description: "FATURAMENTO X META", charType: .COLUMN, options: chartColumn),
                    CardChart.init(description: "PONTO DE EQUILÍBRIO", charType: .FUNNEL, options: chartFunnel),
                    CardChart.init(description: "FATURAMENTO X META", charType: .COLUMN, options: chartColumn),
                    CardChart.init(description: "PONTO DE EQUILÍBRIO", charType: .FUNNEL, options: chartFunnel)
                ]),
            Tips.init(tipsItem: [
                TipsItem.init(title: "O que é uma pergunta treinada?", image: "oque-pergunta-treinada"),
                TipsItem.init(title: "Minhas perguntas treinadas?", image: "perguntas-treinadas"),
                TipsItem.init(title: "Como treinar uma nova pergunta?", image: "treinar-pergunta"),
                TipsItem.init(title: "Gerente Online", image: "gerente-online"),
            ])
        ]
        
        setupView()
    }
    
    fileprivate func setupDataChartColumn(_ description: String) -> HIOptions{
        let options =  HIOptions()
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        let title = HITitle()
        title.text = description
           
        let xaxis = HIXAxis()
        xaxis.categories = ["Apples", "Pears", "Plums", "Bananas", "Oranges", "Strawberry", "Grape", "Jackfruit"]
           
        let yaxis = HIYAxis()
        yaxis.allowDecimals = false
        yaxis.title = HITitle()
        yaxis.title.text = "Units"
    
        let column1 = HIColumn()
        column1.name = "Tiago"
        column1.data = [
                        ["Apples",  3],
                        ["Pears", 2],
                        ["Plums", 5],
                        ["Bananas", 1],
                        ["Oranges" , 9],
                        ["Strawberry", 2],
                        ["Grape", 2],
                        ["Jackfruit", 2]
                    ]
        
        let column2 = HIColumn()
        column2.name = "Ellen";
        column2.data = [
                        ["Apples" , 4],
                        ["Pears" , 0],
                        ["Plums" , 11],
                        ["Bananas" , 1],
                        ["Oranges" , 4],
                        ["Strawberry", 2],
                        ["Grape", 2],
                        ["Jackfruit", 2]
                    ]
        
        let column3 = HIColumn()
        column3.name = "Jheime";
        column3.data = [
                        ["Apples" , 4],
                        ["Pears" , 0],
                        ["Plums" , 11],
                        ["Bananas" , 1],
                        ["Oranges" , 4],
                        ["Strawberry", 2],
                        ["Grape", 2],
                        ["Jackfruit", 2]
                    ]
        
        let column4 = HIColumn()
        column4.name = "Nathan";
        column4.data = [
                        ["Apples" , 4],
                        ["Pears" , 0],
                        ["Plums" , 11],
                        ["Bananas" , 1],
                        ["Oranges" , 4],
                        ["Strawberry", 2],
                        ["Grape", 2],
                        ["Jackfruit", 2]
                    ]

        let column5 = HIColumn()
        column5.name = "Ricardo";
        column5.data = [
                        ["Apples" , 4],
                        ["Pears" , 0],
                        ["Plums" , 11],
                        ["Bananas" , 1],
                        ["Oranges" , 4],
                        ["Strawberry", 2],
                        ["Grape", 2],
                        ["Jackfruit", 2]
                    ]
        
        let chart = HIChart();
        chart.zoomType = "xy";
        chart.type = "column"
        
        options.chart = chart
        options.exporting = exporting
        options.title = title
        options.series = [column1, column2, column3, column4, column5]
        options.credits = credits
        
        return options
    }
    
     fileprivate func setupDataChartFunnel(_ description: String) -> HIOptions{
        let options = HIOptions()
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
    
        let chart = HIChart()
        chart.type = "funnel"
        
        let title = HITitle()
        title.text = description
        
        let plotOptions = HIPlotOptions()
        plotOptions.funnel = HIFunnel()
        plotOptions.funnel.neckWidth = "30%"
        plotOptions.funnel.neckHeight = "25%"
        
        let legend = HILegend()
        legend.enabled = false
        
        let series = HIFunnel()
        series.name = "Unique users"
        series.data = [
                            [
                                "Website visits",
                                15654
                            ],
                            [
                                "Downloads",
                                4064
                            ],
                            [
                                "Requested price list",
                                1987
                            ],
                            [
                                "Invoice sent",
                                976
                            ],
                            [
                                "Finalized",
                                846
                            ]
                    ]
        
        options.chart = chart
        options.exporting = exporting
        options.title = title
        options.plotOptions = plotOptions
        options.legend = legend
        options.series = [series]
        options.credits = credits
        
        return options
    }
}

