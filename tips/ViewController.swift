//
//  ViewController.swift
//  tips
//
//  Created by Dhiman on 12/14/15.
//  Copyright © 2015 Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipLabel: UILabel!
    
    var DefaultSegments  = [20, 22, 25]
    var tipPercentagese: [Double] = [0.0, 0.0, 0.0]
    var tip: Double = 0.0
    var total: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        if((defaults.objectForKey("tipPercentageSE")) != nil)
        {
            tipPercentagese = defaults.objectForKey("tipPercentageSE") as! [Double]
        }
        else        {
            for var i = 0; i < DefaultSegments.count; ++i
            {
                tipPercentagese[i] = Double(DefaultSegments[i])
            }
        }
        
                let segments = tipPercentagese
        
        for var index = 0; index < tipControl.numberOfSegments; ++index
        {
            tipControl.setTitle("\(Int(segments[index]))%", forSegmentAtIndex: index)
        }
        
        billField.becomeFirstResponder()
        
    
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnEditingChanged
        (sender: AnyObject) {
             let tpercentage = tipControl.selectedSegmentIndex
              let tipPercentages = Double(tipPercentagese[tpercentage])
           
            let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
            let tip = billAmount * (tipPercentages * 0.01)
            let total = billAmount + tip
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
            
            tipLabel.text = String(format: "$%.2f",tip)
            totalLabel.text = String(format: "$%.2f",total)

            
    }

    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

