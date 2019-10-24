//
//  ViewController.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

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
               
        data = [
            CardModel.init(description: "FATURAMENTO X META"),
            CardModel.init(description: "PONTO DE EQUILÍBRIO"),
            SideScrollChartsModel.init(title: "PERGUNTAS MAIS ACESSADAS", listChart: [ChartModel.init(title: "FATURAMENTO X META", subtitle: "FATURAMENTO X META")]),
            Tips.init(tipsItem: [
                TipsItem.init(title: "O que é uma pergunta treinada?", image: "oque-pergunta-treinada"),
                TipsItem.init(title: "Minhas perguntas treinadas?", image: "perguntas-treinadas"),
                TipsItem.init(title: "Como treinar uma nova pergunta?", image: "treinar-pergunta"),
                TipsItem.init(title: "Gerente Online", image: "gerente-online"),
            ])
        ]
        
        setupView()
    }
}

