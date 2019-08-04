//
//  ViewController.swift
//  Calculator
//
//  Created by Bronson Berwald on 8/2/19.
//  Copyright © 2019 Bronson Berwald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Used for calculations
    var x_placeInFirst:Bool = true;
    var x_first:Double = 0;
    var x_second:Double = 0;
    var calc_char:String = "";
    
    // Number displayed
    @IBOutlet weak var stored_num: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        stored_num.text = stored_num.text! + String(sender.tag-1)
        if x_placeInFirst {
            x_first = Double(stored_num.text!)!
        } else {
            x_second = Double(stored_num.text!)!
        }
        x_placeInFirst = !x_placeInFirst
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        // + - X /
        if stored_num.text != "" && sender.tag != 11 && sender.tag != 16
        {
            if sender.tag == 12 { //Division
                calc_char = "/"
                
            } else if sender.tag == 13 { //Multiplication
                calc_char = "X"
                
            } else if sender.tag == 14 { //Subtraction
                calc_char = "-"
                
            } else if sender.tag == 15 { //Addition
                calc_char = "+"
                
            }
        } else if sender.tag == 11 { //Clear
            calc_char = "AC"
            
        } else if sender.tag == 16 { //Equal
            calc_char = "="
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

