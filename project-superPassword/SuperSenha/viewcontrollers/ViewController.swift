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
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPassword: Int = Int(tfTtotalPassword.text!) {
            passwordViewController.numberOfPasswords = numberOfPassword
        }
        
        if let nuberOfCharacters: Int = Int(tfTotalCharacters.text!) {
            passwordViewController.numberOfCharacters = nuberOfCharacters
        }
        
        passwordViewController.useLettersTiny = swLettersTiny.isOn
        passwordViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordViewController.useNumbers = swNumbers.isOn
        passwordViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        view.endEditing(true)
    }
    
    @IBAction func generatepasswords(_ sender: UIButton) {
       
    }
    
}

