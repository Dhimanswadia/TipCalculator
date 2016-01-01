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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnEditingChanged
        (sender: AnyObject) {
            var tipPercentages = [0.15,0.18,0.20]
            let tpercentage = tipPercentages[tipControl.selectedSegmentIndex]
            let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
            let tip = billAmount * tpercentage
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

