//
//  ViewController.swift
//  Project2
//
//  Created by Jason Quick on 10/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var wrongAnswer = 0
    var score = 0
    var numberOfQuestionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries += ["estonia",
                      "france",
                      "germany",
                      "ireland",
                      "italy",
                      "monaco",
                      "nigeria",
                      "poland",
                      "russia",
                      "spain",
                      "uk",
                      "us",
                    ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction?) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) score: \(score)"
        numberOfQuestionsAsked += 1
        
    }
    
    func runGameOver(action: UIAlertAction?) {
        let title = "Game Over"
        let message = "Your final Score was \(score) out of 10"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        numberOfQuestionsAsked = 0
        score = 0
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "You got it right."
            score += 1
        } else {
            wrongAnswer = sender.tag
            title = "Wrong!"
            message = "the flag you selected was \(countries[wrongAnswer])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if numberOfQuestionsAsked == 10 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: runGameOver))
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
    }
    
}

