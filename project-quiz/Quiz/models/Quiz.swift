//
//  Quiz.swift
//  Quiz
//
//  Created by Rafael Freitas on 09/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import Foundation

class Quiz {
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self .question = question
        self .options = options
        self .correctedAnswer = correctedAnswer
    }
    
    func validadeOptions(_ index: Int) -> Bool{
        let answer = options[index]
        
        return answer == correctedAnswer
    }
}
