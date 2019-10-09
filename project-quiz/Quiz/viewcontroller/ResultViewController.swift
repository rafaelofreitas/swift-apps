//
//  ResultViewController.swift
//  Quiz
//
//  Created by Rafael Freitas on 09/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close(_ sender: UIButton) {
    }
}
