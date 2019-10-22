//
//  ViewController.swift
//  ContributorProfileRh
//
//  Created by Rafael Freitas on 21/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

enum ComponentType {
    case header
    case footer
    case body
}

class Component {
    var type: ComponentType
    
    init(type: ComponentType) {
        self.type = type
    }
}

class HeaderData: Component {
    let image: UIImage
    let starQuantity: Int
    let average: String
    let titleButton: String
    
    init(image: UIImage, starQuantity: Int, average: String, titleButton: String) {
        self.image = image
        self.starQuantity = starQuantity
        self.average = average
        self.titleButton = titleButton
        
        super.init(type: ComponentType.header)
    }
}

class BodyData: Component {
    let image: UIImage
    let title: String
    let subtitle: String
    
    init(image: UIImage, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        
        super.init(type: ComponentType.body)
    }
}

class FooterData: Component {
    init() {
        super.init(type: ComponentType.footer)
    }
}

class ViewController: UIViewController, CustomHeaderCellDelegate {
    let cellId = "cellId"
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
        
        navigationItem.title = "Perfil Colaborador"
        navigationController?.navigationBar.prefersLargeTitles = true
               
        data = [
            HeaderData.init(image: UIImage(named: "Child")!, starQuantity: 4, average: "Média de 4,0 em 12 avaliações", titleButton: "AVALIAR COLABORADOES"),
            BodyData.init(image: UIImage(named: "Colaborador")!, title:"Colaborador", subtitle: "Rafael de Oliveira Freitas"),
            BodyData.init(image: UIImage(named: "Departamento")!, title:"Departamento", subtitle: "Inovação"),
            BodyData.init(image: UIImage(named: "Cargo")!, title:"Cargo", subtitle: "Software Developer"),
            BodyData.init(image: UIImage(named: "Funcao")!, title:"Função", subtitle: "Software Developer"),
            FooterData.init()
        ]
        
        setupView()
        tableView.separatorStyle = .none
    }
    
    func click() {
        print("clicou arretado")
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row].type {
            case ComponentType.header:
                let cell = CustomHeaderCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.profilePicture = (data[indexPath.row] as! HeaderData).image
                cell.starQuantity = (data[indexPath.row] as! HeaderData).starQuantity
                cell.average = (data[indexPath.row] as! HeaderData).average
                cell.titleButton = (data[indexPath.row] as! HeaderData).titleButton
                cell.delegate = self
                cell.setupView()
                
                return cell
            
            case ComponentType.body:
                let cell = CustomBodyCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.mainImage = (data[indexPath.row] as! BodyData).image
                cell.title = (data[indexPath.row] as! BodyData).title
                cell.subtitle = (data[indexPath.row] as! BodyData).subtitle.uppercased()
                cell.setupView()
                return cell
            
            default:
                let cell = UITableViewCell()
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.backgroundColor = .link
                return cell
        }
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return data.count
    }
    
    func setupView(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
