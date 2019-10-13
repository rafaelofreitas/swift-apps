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
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de Senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLettersTiny: useLettersTiny, useCapitalLetters: useCapitalLetters, useNumbers: useNumbers, useSpecialCharacters: useSpecialCharacters)
        
        generatePassword()
    }
    
    func generatePassword() {
        tvPasswords.text = ""
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + ("\n\n"))
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePassword()
    }
}
