//
//  CalculationManager.swift
//  Calculator
//
//  Created by Heba Thabet Agha on 08.06.23.
//

import Foundation

struct CalculationManager {

    private var enteredNumber: Double?
    private var firstNumberAndCalctionTuple: (number: Double, calculation: String)?
    
    mutating func setEnterendNumber(number: Double) {
        enteredNumber = number
    }
    
    mutating func calculate(calcButton: String) -> Double?{
        if let number = enteredNumber {
            
            switch calcButton {
            case "+/-":
                return number * -1
            case "AC":
                return  0
            case "%":
                return number * 0.01
            case "=":
                return performTowNumCalculation(secondNum: number)
            default:
                firstNumberAndCalctionTuple = (number: number , calculation: calcButton)
            }
        }
        return nil
    }
    
    
    private func performTowNumCalculation (secondNum: Double) -> Double?{
        
        if let firstNum = firstNumberAndCalctionTuple?.number, let operation = firstNumberAndCalctionTuple?.calculation {
            switch operation {
            case "+" :
                return firstNum + secondNum
            case "-" :
                return firstNum - secondNum
            case "×" :
                return firstNum * secondNum
            case "÷" :
                return firstNum / secondNum
            default :
                fatalError("Can't be calculated")
            }
        }
        return nil
    }

}
