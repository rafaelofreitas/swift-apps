//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Rafael Freitas on 12/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLettersTiny: Bool!
    var useCapitalLetters: Bool!
    var useNumbers: Bool!
    var useSpecialCharacters: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generate(_ sender: UIButton) {
    }
}
