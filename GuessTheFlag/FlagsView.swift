//
//  FlagsView.swift
//  GuessTheFlag
//
//  Created by Pedro Eusébio on 15/05/2019.
//  Copyright © 2019 Pedro Eusébio. All rights reserved.
//

import Foundation
import UIKit

class FlagsView : UIView {
    
    weak var delegate: QuestionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addFlagButtonsToView()
    }
    
    func addFlagButtonsToView(){
        addSubview(flag1Button)
        addSubview(flag2Button)
        addSubview(flag3Button)
        
        activateFlag1ButtonConstraints()
        activateFlag2ButtonConstraints()
        activateFlag3ButtonConstraints()
    }
    
    func activateFlag1ButtonConstraints() {
        let flag1ButtonConstraints = [flag1Button.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                      flag1Button.widthAnchor.constraint(equalToConstant: 200),
                                      flag1Button.heightAnchor.constraint(equalToConstant: 100),
                                      flag1Button.centerXAnchor.constraint(equalTo: centerXAnchor)]
        
        NSLayoutConstraint.activate(flag1ButtonConstraints)
    }
    
    func activateFlag2ButtonConstraints() {
        let flag2ButtonConstraints = [flag2Button.topAnchor.constraint(equalTo: flag1Button.bottomAnchor, constant: 50),
                                      flag2Button.widthAnchor.constraint(equalToConstant: 200),
                                      flag2Button.heightAnchor.constraint(equalToConstant: 100),
                                      flag2Button.centerXAnchor.constraint(equalTo: centerXAnchor)]
        
        NSLayoutConstraint.activate(flag2ButtonConstraints)
    }
    
    func activateFlag3ButtonConstraints() {
        let flag2ButtonConstraints = [flag3Button.topAnchor.constraint(equalTo: flag2Button.bottomAnchor, constant: 50),
                                      flag3Button.widthAnchor.constraint(equalToConstant: 200),
                                      flag3Button.heightAnchor.constraint(equalToConstant: 100),
                                      flag3Button.centerXAnchor.constraint(equalTo: centerXAnchor)]
        
        NSLayoutConstraint.activate(flag2ButtonConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let flag1Button : UIButton = {
        var button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(didTouchFlag1Button), for: .touchUpInside)
        return button
    }()
    
    @objc func didTouchFlag1Button(_ sender: AnyObject){
        
        guard sender is UIButton else {
            print("Error")
            return
        }
        
        delegate?.validateAnswer(button: 0)
    }
    
    let flag2Button : UIButton = {
        var button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(didTouchFlag2Button), for: .touchUpInside)
        return button
    }()
    
    @objc func didTouchFlag2Button(_ sender: AnyObject){
        
        guard sender is UIButton else {
            print("Error")
            return
        }
        
        delegate?.validateAnswer(button: 1)
    }
    
    let flag3Button : UIButton = {
        var button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(didTouchFlag3Button), for: .touchUpInside)
        return button
    }()
    
    @objc func didTouchFlag3Button(_ sender: AnyObject){
        
        guard sender is UIButton else {
            print("Error")
            return
        }
        
        delegate?.validateAnswer(button: 2)
    }
    
}
