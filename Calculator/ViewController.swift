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
    var x:Double = 0;
    
    // Number displayed
    @IBOutlet weak var stored_num: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        stored_num.text = stored_num.text! + String(sender.tag-1)
        x = Double(stored_num.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        // + - X /
        if stored_num.text != "" && sender.tag != 11 && sender.tag != 16
        {
            if sender.tag == 12 { //Division
                
            } else if sender.tag == 13 { //Multiplication
                
            } else if sender.tag == 14 { //Subtraction
                
            } else if sender.tag == 15 { //Addition
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

