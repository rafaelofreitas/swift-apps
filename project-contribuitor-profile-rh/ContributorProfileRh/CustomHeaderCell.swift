//
//  CustomHeaderCell.swift
//  ContributorProfileRh
//
//  Created by Rafael Freitas on 22/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit
import HCSStarRatingView

protocol CustomHeaderCellDelegate {
    func click()
}

class CustomHeaderCell: UITableViewCell {
    var profilePicture: UIImage?
    var starQuantity: Int?
    var average: String?
    var titleButton: String?
    var delegate: CustomHeaderCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    lazy var profilePictureView: UIImageView = {
        var circularImage = UIImageView()
        circularImage.translatesAutoresizingMaskIntoConstraints = false
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = 25
        return circularImage
    }()
    
    lazy var starQuantityView: HCSStarRatingView = {
        var starRatingView = HCSStarRatingView()
        starRatingView.translatesAutoresizingMaskIntoConstraints = false
        starRatingView.maximumValue = 5
        starRatingView.minimumValue = 0
        starRatingView.tintColor = .red
        
        return starRatingView
    }()
    
    lazy var btnAvaliarColaboradorView: UIButton = {
        var btnAvaliarColaborador = UIButton()
        btnAvaliarColaborador.translatesAutoresizingMaskIntoConstraints = false
        let yourColor : UIColor = .link
        btnAvaliarColaborador.layer.cornerRadius = 5
        btnAvaliarColaborador.layer.borderWidth = 1
        btnAvaliarColaborador.layer.borderColor = yourColor.cgColor
        btnAvaliarColaborador.setTitleColor(.link, for: .normal)
        
        btnAvaliarColaborador.addTarget(self, action: #selector(didTappedOnBackgroundView), for: .touchDown)
        
        return btnAvaliarColaborador
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        
        return lineView
    }()
    
    lazy var avaliacoesView : UILabel = {
        var avaliacoesView = UILabel()
        avaliacoesView.translatesAutoresizingMaskIntoConstraints = false
        avaliacoesView.textColor = .link
        avaliacoesView.numberOfLines = 0
        
        return avaliacoesView
    }()
    
    func setupView() {
        self.addSubview(profilePictureView)
        self.addSubview(starQuantityView)
        self.addSubview(avaliacoesView)
        self.addSubview(btnAvaliarColaboradorView)
        self.addSubview(lineView)
        
        dataSubviews()
        
        let constraints = [
            profilePictureView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            profilePictureView.widthAnchor.constraint(equalToConstant: 100),
            profilePictureView.heightAnchor.constraint(equalToConstant: 100),
            profilePictureView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            starQuantityView.topAnchor.constraint(equalTo: profilePictureView.bottomAnchor, constant: 10),
            starQuantityView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            avaliacoesView.topAnchor.constraint(equalTo: starQuantityView.bottomAnchor, constant: 10),
            avaliacoesView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            btnAvaliarColaboradorView.topAnchor.constraint(equalTo: avaliacoesView.bottomAnchor, constant: 15),
            btnAvaliarColaboradorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnAvaliarColaboradorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 70),
            btnAvaliarColaboradorView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70),
            btnAvaliarColaboradorView.heightAnchor.constraint(equalToConstant: 45),
            
            lineView.topAnchor.constraint(equalTo: self.btnAvaliarColaboradorView.bottomAnchor, constant: 20),
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor),
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func dataSubviews() {
        if let image = profilePicture {
            profilePictureView.image = image
        }
        
        if let starQuantity = starQuantity {
            starQuantityView.value = CGFloat(starQuantity)
        }
        
        if let average = average {
            avaliacoesView.text = average
        }
        
        if let titleButton = titleButton {
            btnAvaliarColaboradorView.setTitle(titleButton, for: .normal)
        }
    }
    
    @objc func didTappedOnBackgroundView() {
        delegate?.click()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
