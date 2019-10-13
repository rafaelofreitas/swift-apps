//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Rafael Freitas on 12/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useLettersTiny: Bool!
    var useCapitalLetters: Bool!
    var useNumbers: Bool!
    var useSpecialCharacters: Bool!
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+={[}]|:;?/<>"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLettersTiny: Bool,
         useCapitalLetters: Bool, useNumbers: Bool, useSpecialCharacters: Bool)
    {
        var numchars: Int = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacters = numchars
        self.useLettersTiny = useLettersTiny
        self.useCapitalLetters = useCapitalLetters
        self.useNumbers = useNumbers
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLettersTiny {
            universe += letters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        
        return passwords
    }
}
