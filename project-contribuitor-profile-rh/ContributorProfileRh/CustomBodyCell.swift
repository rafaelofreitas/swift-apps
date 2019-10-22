//
//  CustomBodyCell.swift
//  ContributorProfileRh
//
//  Created by Rafael Freitas on 21/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class CustomBodyCell: UITableViewCell {
    var mainImage: UIImage?
    var title: String?
    var subtitle: String?
    
    var mainImageView: UIImageView = {
        var mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainImageView
    }()
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        titleView.textColor = .link
        
        return titleView
    }()
    
    var lineView: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        
        return lineView
    }()
    
    var subtitleView: UILabel = {
        var subTitleView = UILabel()
        subTitleView.translatesAutoresizingMaskIntoConstraints = false
        subTitleView.font = UIFont.boldSystemFont(ofSize: 16)
        subTitleView.textColor = .link
        subTitleView.numberOfLines = 0
        
        return subTitleView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        self.addSubview(mainImageView)
        self.addSubview(titleView)
        self.addSubview(subtitleView)
        self.addSubview(lineView)
        
        dataSubviews()

        let constraints = [
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            
            titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 18),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            subtitleView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5),
            subtitleView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 18),
            subtitleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            lineView.topAnchor.constraint(equalTo: self.subtitleView.bottomAnchor, constant: 15),
            lineView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 18),
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func dataSubviews() {

        
        if let title = title {
            titleView.text = title
        }
        
        if let subtitle = subtitle {
            subtitleView.text = subtitle
        }
        
        if let image = mainImage {
            mainImageView.image = image
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
