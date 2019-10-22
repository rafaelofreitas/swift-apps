//
//  CustomCell.swift
//  ContributorProfileRh
//
//  Created by Rafael Freitas on 21/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var title: String?
    var subtitle: String?
    var mainImage: UIImage?
    
    var titleView: UITextView = {
        var titleView = UITextView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.isScrollEnabled = false
        titleView.isEditable = false
        titleView.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        titleView.textColor = .link
        
        return titleView
    }()
    
    
    var subtitleView: UITextView = {
        var subTitleView = UITextView()
        subTitleView.translatesAutoresizingMaskIntoConstraints = false
        subTitleView.isScrollEnabled = false
        subTitleView.isEditable = false
        subTitleView.font = UIFont.boldSystemFont(ofSize: 15)
        subTitleView.textColor = .link
        
        return subTitleView
    }()

    var mainImageView: UIImageView = {
        var mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainImageView)
        self.addSubview(titleView)
        self.addSubview(subtitleView)
        
        let constraints = [
            mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            mainImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -30),
        
            titleView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 18),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: -15),
            
            subtitleView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 18),
            subtitleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            subtitleView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: -11),
            subtitleView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
