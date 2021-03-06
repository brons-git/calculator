//
//  ViewController.swift
//  Calculator
//
//  Created by Bronson Berwald on 8/2/19.
//  Copyright © 2019 Bronson Berwald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Buttons
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var inverseBtn: UIButton!
    @IBOutlet weak var percentBtn: UIButton!
    @IBOutlet weak var divisionBtn: UIButton!
    @IBOutlet weak var multiplicationBtn: UIButton!
    @IBOutlet weak var subtractionBtn: UIButton!
    @IBOutlet weak var additionBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var calculateBtn: UIButton!
    
    // Labels
    //@IBOutlet weak var prev_ans: UILabel!
    @IBOutlet weak var label: UILabel!
    
    // Variables
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var clear_prev_output = true
    var decimal_restricted = false
    var inversing = false
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Defaults
        label.text = "0.0"
        btnDefaultStates()
    }
    
    // Number Pressed
    @IBAction func numbers(_ sender: UIButton) {
        btnDefaultStates()
        
        // Second Number for Calculation
        if performingMath == true {
            if sender.tag == 19 {
                check_decimal_restriction()
            } else {
                if inversing == true {
                    label.text = "-" + String(sender.tag-1)
                    inversing = false
                } else {
                    label.text = String(sender.tag-1)
                }
            }
            clear_prev_output = false
            performingMath = false
            
        // First Number for Calculation
        } else {
            // New number
            if clear_prev_output == true {
                // Decimal
                if sender.tag == 19 {
                    check_decimal_restriction()
                } else {
                    label.text = ""
                    // Add new data
                    label.text = label.text! + String(sender.tag-1)
                }
                clear_prev_output = false
                
            // Existing Number
            } else if clear_prev_output == false {
                // Decimal
                if sender.tag == 19 {
                    check_decimal_restriction()
                } else {
                    // Add new data
                    label.text = label.text! + String(sender.tag-1)
                }
            } else {
                print("ERROR; Number pressed")
                
            }
        }
    }
    
    // Operation Pressed
    @IBAction func buttons(_ sender: UIButton) {
        btnDefaultStates()
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 { //Division
                divisionBtn.backgroundColor = UIColor.green
            } else if sender.tag == 13 { //Multiplication
                multiplicationBtn.backgroundColor = UIColor.green
            } else if sender.tag == 14 { //Subtraction
                subtractionBtn.backgroundColor = UIColor.green
            } else if sender.tag == 15 { //Addition
                additionBtn.backgroundColor = UIColor.green
            }
            operation = sender.tag
            performingMath = true
            clear_prev_output = true
            decimal_restricted = false
            
        // Calculate
        } else if sender.tag == 16 {
            numberOnScreen = Double(label.text!)!
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            } else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            } else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            } else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
            btnDefaultStates()
            clear_prev_output = true
            
        // All Clear
        } else if sender.tag == 11 {
            btnDefaultStates()
            label.text = "0.0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            clear_prev_output = true
            decimal_restricted = false
            
        // Inverse
        } else if sender.tag == 17 {
            if label.text == "0.0" {
                label.text = "-"
                clear_prev_output = false
            } else if performingMath == true {
                label.text = "-"
                clear_prev_output = false
                inversing = true
            } else {
                label.text = "-" + label.text!
            }
            
        // Percentage
        } else if sender.tag == 18 {
            
        }
        
    }
    
    func check_decimal_restriction() {
        if decimal_restricted == true {
            print("cannot use decimal twice")
        } else if decimal_restricted == false && clear_prev_output == true {
            label.text = "0."
        } else if decimal_restricted == false && clear_prev_output == false {
            label.text = label.text! + "."
        }
        decimal_restricted = true
    }
}

