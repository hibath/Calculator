//
//  CalculationManager.swift
//  Calculator
//
//  Created by Heba Thabet Agha on 08.06.23.
//

import Foundation

struct CalculationManager {

    private var enteredNumber: Double?
    
    mutating func setEnterendNumber(number: Double) {
        enteredNumber = number
    }
    func calculate(calcButton: String) -> Double?{
        if let number = enteredNumber {
            
            if calcButton == "+/-" {
                return number * -1
            }
            else if calcButton == "AC" {
                return  0
            }
            else if calcButton == "%" {
                return number * 0.01
            }
        }
        return nil
    }

}
