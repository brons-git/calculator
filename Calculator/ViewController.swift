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
    
    // Variables
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var clear_prev_output = true
    
    // Number displayed
    //@IBOutlet weak var prev_ans: UILabel!
    @IBOutlet weak var label: UILabel!
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Defaults
        label.text = "0"
        btnDefaultStates()
    }
    
    // Number Pressed
    @IBAction func numbers(_ sender: UIButton) {
        // Set Buttons To Default States
        btnDefaultStates()
        
        // Second Number for Calculation
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            // First Number for Calculation
        } else {
            
            if clear_prev_output == true {
                label.text = ""
                // Add new data
                operation = 0;
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
                clear_prev_output = false
            } else {
                // Add new data
                operation = 0;
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
            }
        }
    }
    
    // Operation Pressed
    @IBAction func buttons(_ sender: UIButton) {
        // + - X /
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 { //Division
                divisionBtn.backgroundColor = UIColor.blue
            } else if sender.tag == 13 { //Multiplication
                multiplicationBtn.backgroundColor = UIColor.blue
            } else if sender.tag == 14 { //Subtraction
                subtractionBtn.backgroundColor = UIColor.blue
            } else if sender.tag == 15 { //Addition
                additionBtn.backgroundColor = UIColor.blue
            }
            operation = sender.tag
            performingMath = true
            clear_prev_output = true
            
            // Calculate
        } else if sender.tag == 16 {
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
            
            // All Clear
        } else if sender.tag == 11 {
            btnDefaultStates()
            label.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            clear_prev_output = true
        }
    }
    
    // Set buttons back to default state
    func btnDefaultStates() {
        //        clearBtn.backgroundColor = UIColor.black
        clearBtn.layer.cornerRadius = 35
        clearBtn.clipsToBounds = true
        
        //        clearBtn.backgroundColor = UIColor.black
        clearBtn.layer.cornerRadius = 35
        clearBtn.clipsToBounds = true
        
        //        inverseBtn.backgroundColor = UIColor.black
        inverseBtn.layer.cornerRadius = 35
        inverseBtn.clipsToBounds = true
        
        //        percentBtn.backgroundColor = UIColor.black
        percentBtn.layer.cornerRadius = 35
        percentBtn.clipsToBounds = true
        
        //        divisionBtn.backgroundColor = UIColor.black
        divisionBtn.layer.cornerRadius = 35
        divisionBtn.clipsToBounds = true
        
        //        multiplicationBtn.backgroundColor = UIColor.black
        multiplicationBtn.layer.cornerRadius = 35
        multiplicationBtn.clipsToBounds = true
        
        //        subtractionBtn.backgroundColor = UIColor.black
        subtractionBtn.layer.cornerRadius = 35
        subtractionBtn.clipsToBounds = true
        
        //        additionBtn.backgroundColor = UIColor.black
        additionBtn.layer.cornerRadius = 35
        additionBtn.clipsToBounds = true
        
        //        decimalBtn.backgroundColor = UIColor.black
        decimalBtn.layer.cornerRadius = 35
        decimalBtn.clipsToBounds = true
        
        //        zeroBtn.backgroundColor = UIColor.black
        zeroBtn.layer.cornerRadius = 35
        zeroBtn.clipsToBounds = true
        
        //        oneBtn.backgroundColor = UIColor.black
        oneBtn.layer.cornerRadius = 35
        oneBtn.clipsToBounds = true
        
        //        twoBtn.backgroundColor = UIColor.black
        twoBtn.layer.cornerRadius = 35
        twoBtn.clipsToBounds = true
        
        //        threeBtn.backgroundColor = UIColor.black
        threeBtn.layer.cornerRadius = 35
        threeBtn.clipsToBounds = true
        
        //        fourBtn.backgroundColor = UIColor.black
        fourBtn.layer.cornerRadius = 35
        fourBtn.clipsToBounds = true
        
        //        fiveBtn.backgroundColor = UIColor.black
        fiveBtn.layer.cornerRadius = 35
        fiveBtn.clipsToBounds = true
        
        //        sixBtn.backgroundColor = UIColor.black
        sixBtn.layer.cornerRadius = 35
        sixBtn.clipsToBounds = true
        
        //        sevenBtn.backgroundColor = UIColor.black
        sevenBtn.layer.cornerRadius = 35
        sevenBtn.clipsToBounds = true
        
        //        eightBtn.backgroundColor = UIColor.black
        eightBtn.layer.cornerRadius = 35
        eightBtn.clipsToBounds = true
        
        //        nineBtn.backgroundColor = UIColor.black
        nineBtn.layer.cornerRadius = 35
        nineBtn.clipsToBounds = true
        
        //        calculateBtn.backgroundColor = UIColor.black
        calculateBtn.layer.cornerRadius = 35
        calculateBtn.clipsToBounds = true
    }
    
    
    
}
