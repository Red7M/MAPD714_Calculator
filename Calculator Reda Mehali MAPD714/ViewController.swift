//
//  ViewController.swift
//  Calculator Reda Mehali MAPD714
//  Student ID: 301159604
//  Created by Reda Mehali on 10/2/20.
//
//  Displays graphical user interface of
//  a calculator app
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var operation = 0
    var performingMath = false
    var resetResult = false
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func numbers(_ sender: Any)
    {
        if (resetResult) {
            result.text = ""
            resetResult = false
        }
        
        if performingMath == true {
            result.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(result.text!)!
            performingMath = false
        } else {
            if (result.text! == "0") {
                result.text = ""
            }
            if (sender as AnyObject).tag == 17 && result.text == "" {
                result.text = "0."
            } else if (sender as AnyObject).tag == 17 && result.text != "" {
                result.text = result.text! + "."
            } else {
                result.text = result.text! + String((sender as AnyObject).tag-1)
            }
            numberOnScreen = Double(result.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if result.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 18 {
            previousNumber = Double(result.text!)!
            operation = sender.tag
            performingMath = true;
        } // Equal operator
        else if sender.tag == 16 {
            // Division
            if operation == 12 {
                result.text = String(previousNumber / numberOnScreen)
            } // Multiplication
            else if operation == 13 {
                result.text = String(previousNumber * numberOnScreen)
            } // Subtraction
            else if operation == 14 {
                result.text = String(previousNumber - numberOnScreen)
            } //Addition
            else if operation == 15 {
                result.text = String(previousNumber + numberOnScreen)
            }
            
            convertDoubleToInteger()
            resetResult = true
        } // delete Operator
        else if sender.tag == 11 {
            result.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        } // +/- operators
        else if sender.tag == 18 {
            var doubleVal = Double(result.text!)!
            doubleVal = -doubleVal
            result.text = String(doubleVal)
            convertDoubleToInteger()
        }
    }
    
    func convertDoubleToInteger()
    {
        let valueInDouble = Double(result.text!)!
        if (valueInDouble.truncatingRemainder(dividingBy: 1) == 0)
        {
            result.text = String(Int(valueInDouble))
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

