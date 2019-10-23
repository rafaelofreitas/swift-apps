//
//  UIViewControllerExtension.swift
//  highchartExample
//
//  Created by Rafael Freitas on 23/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.


import Foundation
import UIKit

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row].type {
            case .CARD:
                let cell = CustomCardCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.mainDescription = (data[indexPath.row] as! CardModel).description
                cell.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
                cell.setupView()
                return cell

            case .TIPS:
                let cell = CustomTipsCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.tip = data[indexPath.row] as! TipsModel
                cell.backgroundColor = UtilsColor.hexStringToUIColor(hex: "#FFFFFF")
                cell.setupView()
                return cell

            case .LISTCHART:
                let cell = CustomSideScrollChartsCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.title = (data[indexPath.row] as! SideScrollChartsModel).title
                cell.setupView()
                return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func setupView(){
        self.view.addSubview(tableView)

        self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}

