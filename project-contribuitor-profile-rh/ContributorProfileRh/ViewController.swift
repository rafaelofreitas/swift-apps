//
//  ViewController.swift
//  ContributorProfileRh
//
//  Created by Rafael Freitas on 21/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

struct CellData {
    let image: UIImage?
    let title: String?
    let subtitle: String?
}

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Perfil Colaborador"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        data = [
            CellData.init(image: UIImage(named: "Colaborador"), title:"Colaborador", subtitle: "Rafael de Oliveira Freitas"),
            CellData.init(image: UIImage(named: "Departamento"), title:"Departamento", subtitle: "Inovação"),
            CellData.init(image: UIImage(named: "Cargo"), title:"Cargo", subtitle: "Software Developer"),
            CellData.init(image: UIImage(named: "Funcao"), title:"Função", subtitle: "Software Developer")
        ]
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.mainImage = data[indexPath.row].image
        cell.title = data[indexPath.row].title
        cell.subtitle = data[indexPath.row].subtitle?.uppercased()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

