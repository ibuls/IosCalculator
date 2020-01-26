//
//  ViewController.swift
//  Calculator App
//
//  Created by Piyush Bulchandani on 26/01/20.
//  Copyright © 2020 Piyush Bulchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    

    var firstValue: String = ""
      var currentOperation: Operator = Operator.nothing
      var calcState: CalculationState = CalculationState.enteringNum

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberClickd(sender: UIButton){
        
        updateDisplay(number: String(sender.tag))
    }
       func updateDisplay (number: String) {
         if calcState == CalculationState.newNumStarted {
             if let num = displayLabel.text {
                 if num != "" {
                     firstValue = num
                 }
             }
             calcState = CalculationState.enteringNum
             displayLabel.text = number
         }
         else if calcState == CalculationState.enteringNum {
             displayLabel.text = displayLabel.text! + number
         }
     }
     
    
    @IBAction func operatorClicked(sender: UIButton){
         calcState = CalculationState.newNumStarted
        if let num = displayLabel.text {
            if num != "" {
                firstValue = num
                displayLabel.text = ""
            }
        }
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
            updateOperatorButton(tag: sender.tag)
        case 11:
            currentOperation = Operator.subtract
            updateOperatorButton(tag: sender.tag)
        case 12:
            currentOperation = Operator.times
            updateOperatorButton(tag: sender.tag)
        case 13:
            currentOperation = Operator.divide
            updateOperatorButton(tag: sender.tag)
        default:
            return
        }
    }
    
    func updateOperatorButton(tag:Int){
        
        for tag in 10..<14{
            if let btn = self.view.viewWithTag(tag) as? UIButton{
                //clear background color of all operator buttons
                btn.backgroundColor = UIColor.clear
            }
        }
        if let btn = self.view.viewWithTag(tag) as? UIButton{
            btn.backgroundColor = UIColor.yellow
        }
    }
    
    @IBAction func equalsClicked(sender: UIButton){
        calculateSum()
    }
    
    func calculateSum(){
      if firstValue.isEmpty {
          return
      }
      
      var result = ""
      
      if currentOperation == Operator.times {
          result = "\(Double(firstValue)! * Double(displayLabel.text!)!)"
      } else if currentOperation == Operator.divide {
          result = "\(Double(firstValue)! / Double(displayLabel.text!)!)"
      } else if currentOperation == Operator.subtract {
          result = "\(Double(firstValue)! - Double(displayLabel.text!)!)"
      } else if currentOperation == Operator.add {
          result = "\(Double(firstValue)! + Double(displayLabel.text!)!)"
      }
      
      displayLabel.text = result
      calcState = CalculationState.newNumStarted
        
    }
    
    
    func showAlert(title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        
        self.present(alert, animated: true)
    }
    
    
}

