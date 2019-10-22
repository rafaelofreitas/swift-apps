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

class ViewController: UIViewController{
    
    let cellId = "cellId"
    var data = [CellData]()
    
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
    
    lazy var btnAvaliarColaborador: UIButton = {
        var btnAvaliarColaborador = UIButton()
        
        let yourColor : UIColor = .link
        
        btnAvaliarColaborador.layer.cornerRadius = 5
        btnAvaliarColaborador.layer.borderWidth = 1
        btnAvaliarColaborador.layer.borderColor = yourColor.cgColor
        btnAvaliarColaborador.setTitleColor(.link, for: .normal)
        btnAvaliarColaborador.setTitle("AVALIAR COLABORADOES", for: .normal)
        btnAvaliarColaborador.translatesAutoresizingMaskIntoConstraints = false
        
        return btnAvaliarColaborador
    }()
    
    var lineView: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        
        return lineView
    }()
    
    var avaliacoesView : UILabel = {
        var avaliacoesView = UILabel()
        avaliacoesView.translatesAutoresizingMaskIntoConstraints = false
        avaliacoesView.textColor = .link
        avaliacoesView.numberOfLines = 0
        avaliacoesView.text = "Média de 4,0 em 12 avaliações"
        
        return avaliacoesView
    }()
    
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
        
        setupView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
    func setupView(){
        view.addSubview(avaliacoesView)
        view.addSubview(btnAvaliarColaborador)
        view.addSubview(lineView)
        view.addSubview(tableView)
        
        avaliacoesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        avaliacoesView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        btnAvaliarColaborador.topAnchor.constraint(equalTo: avaliacoesView.topAnchor, constant: 30).isActive = true
        btnAvaliarColaborador.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnAvaliarColaborador.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        btnAvaliarColaborador.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
        btnAvaliarColaborador.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        lineView.topAnchor.constraint(equalTo: self.btnAvaliarColaborador.bottomAnchor, constant: 24).isActive = true
        lineView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        tableView.topAnchor.constraint(equalTo: self.lineView.topAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = CustomCell()
          cell.mainImage = data[indexPath.row].image
          cell.title = data[indexPath.row].title
          cell.subtitle = data[indexPath.row].subtitle?.uppercased()
          cell.setupView()
          
          return cell
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return data.count
    }
}
