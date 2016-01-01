//
//  SettingViewController.swift
//  tips
//
//  Created by Dhiman on 12/31/15.
//  Copyright © 2015 Dhiman. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet  var tip1Field: UITextField!
    @IBOutlet  var tip2Field: UITextField!
    @IBOutlet  var tipThreeField: UITextField!
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tip1Label: UILabel!
    @IBOutlet var tip2Label: UILabel!
    @IBOutlet var tip3Label: UILabel!
    
    
    var tipPercentageSE: [Double] = [20.0, 22.0, 25.0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        
        // Making labels disapear from the screen
        titleLabel.center.x  -= view.bounds.width
        tip1Label.center.x -= view.bounds.width
        tip2Label.center.x -= view.bounds.width
        tip3Label.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
        
        // Making each label appear one after the other from top to bottom
        UIView.animateWithDuration(0.4, delay: 0.4, options: [], animations: {
            self.titleLabel.center.x += self.view.bounds.width
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.4, delay: 0.4, options: [], animations: {
            self.tip1Label.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.5, options: [], animations: {
            self.tip2Label.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.6, options: [], animations: {
            self.tip3Label.center.x += self.view.bounds.width
            }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged1(sender: AnyObject) {
        let tipOne = NSString(string: tip1Field.text!).doubleValue
        tipPercentageSE[0] = tipOne
    }
    
    
    @IBAction func onEditingChanged2(sender: AnyObject) {
        let tipTwo = NSString(string: tip2Field.text!).doubleValue
        tipPercentageSE[1] = tipTwo
        
    }
    
    
    @IBAction func onEditingChangedThree(sender: AnyObject) {
        let tipThree = NSString(string: tipThreeField.text!).doubleValue
        tipPercentageSE[2] = tipThree
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
        // Save settings when user tap the screen
        //print(tipPercentageSE, terminator: "")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipPercentageSE, forKey: "tipPercentageSE")
        defaults.synchronize()
        
    }
    

}
