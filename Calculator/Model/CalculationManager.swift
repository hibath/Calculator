//
//  CalculationManager.swift
//  Calculator
//
//  Created by Heba Thabet Agha on 08.06.23.


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
                return performTowNumCalculation(secondNumber: number)
            default:
                firstNumberAndCalctionTuple = (number: number , calculation: calcButton)
            }
        }
        return nil
    }
    
    
    private func performTowNumCalculation (secondNumber: Double) -> Double?{
        
        if let firstNumber = firstNumberAndCalctionTuple?.number, let operation = firstNumberAndCalctionTuple?.calculation {
            switch operation {
            case "+" :
                return firstNumber + secondNumber
            case "-" :
                return firstNumber - secondNumber
            case "×" :
                return firstNumber * secondNumber
            case "÷" :
                return firstNumber / secondNumber
            default :
                fatalError("Can't be calculated")
            }
        }
        return nil
    }

}
