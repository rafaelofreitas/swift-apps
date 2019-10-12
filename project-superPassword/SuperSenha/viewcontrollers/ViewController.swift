//
//  ViewController.swift
//  SuperSenha
//
//  Created by Rafael Freitas on 10/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfTtotalPassword: UITextField!
    @IBOutlet weak var tfTotalCharacters: UITextField!
    @IBOutlet weak var swLettersTiny: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generatepasswords(_ sender: UIButton) {
    }
    
}

