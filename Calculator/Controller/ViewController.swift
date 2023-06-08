//
//  ViewController.swift
//  Calculator
//
//  Created by Heba Thabet Agha on 07.06.23.
//  Computed Property
//  Getter and Setter
//  Swift Tuple

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    private var isInputComplete : Bool = true
    var  calcManager = CalculationManager()
    
    private var displayNumber: Double {
        get {
            guard let currentNumber = Double(mainLabel.text!) else {
                fatalError("can't be converted to double")
            }
            return currentNumber
        }
        set {
            mainLabel.text =  String(format: "%.1f", newValue)
        }
    }
    
    @IBAction func numberPressedButton(_ sender: UIButton!) {
        
        if let number = sender.currentTitle {
            if isInputComplete {
                mainLabel.text = number
                isInputComplete = false
            }
            else {
                if number == "." {
                    // to check if . is already pressed
                    let isIntVaule = floor(displayNumber) == displayNumber
                    if !isIntVaule {
                        return
                    }
                }
                mainLabel.text = mainLabel.text! + number
            }
        }
    }
    
    
    @IBAction func calcPressedButton(_ sender: UIButton!) {
        isInputComplete = true
        calcManager.setEnterendNumber(number: displayNumber)        
        if let calcButton = sender.currentTitle {
            if let calcResult = calcManager.calculate(calcButton: calcButton) {
                displayNumber = calcResult
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

