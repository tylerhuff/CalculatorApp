//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Tyler Huff on 10/13/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
        print(self.number)
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
            else if symbol == "%" {
                return n * 0.01
            }
            else if symbol == "AC" {
                return 0
            }
            else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            }
            else {
                intermediateCalculation = (n1: n, calcMethod:  symbol)
            }
        }
        return nil
    }
    
    
    private  func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any cases")
            }
        }
        return nil
    }
    
}
