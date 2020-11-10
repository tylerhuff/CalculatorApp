//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        //What should happen when a non-number button is pressed
        if let calcMethod = sender.currentTitle {
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numVal = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            } else {
                
                if numVal == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numVal
            }
        }
    }
    
}

