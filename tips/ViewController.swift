//
//  ViewController.swift
//  tips
//
//  Created by Rajiv Bammi on 9/1/15.
//  Copyright (c) 2015 Rajiv Bammi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //println("Main view will appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipValue = defaults.integerForKey("defaultTip")
        
        println("Default value is => \(defaultTipValue)")
        tipControl.selectedSegmentIndex = defaultTipValue
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //println("user edited bill")
        var tipPercentages = [0.18, 0.20, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
       
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

