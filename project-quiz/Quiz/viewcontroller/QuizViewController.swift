//
//  QuizViewController.swift
//  Quiz
//
//  Created by Rafael Freitas on 09/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        
        UIView.animate(withDuration: 30.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let options = quizManager.options[i]
            let button = btAnswers[i]
            
            button.setTitle(options, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.firstIndex(of: sender)!
        quizManager.validadeAnswer(index: index)
        
        getNewQuiz()
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
}
