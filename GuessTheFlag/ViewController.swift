//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Pedro Eusébio on 15/05/2019.
//  Copyright © 2019 Pedro Eusébio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuestionDelegate {
    
    var countries = [String]()
    
    var correctAnswer = ""
    
    var flagOnFirstButton = ""
    var flagOnSecondButton = ""
    var flagOnThirdButton = ""
    
    var score = 0
    var totalNumberOfPlays = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addFlagsView()
        flagsView.delegate = self
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }

    func addFlagsView(){
        view.addSubview(flagsView)
        
        let flagsViewConstraints: [NSLayoutConstraint] = [flagsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                                          flagsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                                          flagsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                                          flagsView.topAnchor.constraint(equalTo: view.topAnchor)]
        
        NSLayoutConstraint.activate(flagsViewConstraints)
    }
    
    let flagsView: FlagsView = {
        let flagsView = FlagsView()
        flagsView.translatesAutoresizingMaskIntoConstraints = false
        return flagsView
    }()
    
    func askQuestion(){
        var shuffledCountries = countries.shuffled()
        
        flagOnFirstButton = shuffledCountries[0]
        flagOnSecondButton = shuffledCountries[1]
        flagOnThirdButton = shuffledCountries[2]
        
        flagsView.flag1Button.setImage(UIImage(named: flagOnFirstButton), for: .normal)
        flagsView.flag2Button.setImage(UIImage(named: flagOnSecondButton), for: .normal)
        flagsView.flag3Button.setImage(UIImage(named: flagOnThirdButton), for: .normal)
        
        let range = 0...2
        correctAnswer = shuffledCountries[range.randomElement()!]
        
        navigationItem.title = correctAnswer.uppercased()
    }
    
    func validateAnswer(button: Int) {
        switch button {
        case 0:
            totalNumberOfPlays += 1
            
            if flagOnFirstButton.elementsEqual(correctAnswer) {
                answerIsCorrect()
            } else {
                answerIsWrong()
            }
        case 1:
            totalNumberOfPlays += 1
            
            if flagOnSecondButton.elementsEqual(correctAnswer) {
                answerIsCorrect()
            } else {
                answerIsWrong()
            }
        case 2:
            totalNumberOfPlays += 1
            
            if flagOnThirdButton.elementsEqual(correctAnswer) {
                answerIsCorrect()
            } else {
                answerIsWrong()
            }
        default:
            print("Error! Invalid button")
        }
        
        askQuestion()
    }
    
    func answerIsCorrect(){
        score += 1
        print("CORRECT! Score: \(score)/\(totalNumberOfPlays)")
    }
    
    func answerIsWrong(){
        print("WRONG! Score: \(score)/\(totalNumberOfPlays)")
    }
}

protocol QuestionDelegate: class {
    func validateAnswer(button: Int)
}
