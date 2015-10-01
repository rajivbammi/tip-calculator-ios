//
//  TipViewController.swift
//  tips
//
//  Created by Rajiv Bammi on 9/2/15.
//  Copyright (c) 2015 Rajiv Bammi. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var settingsTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
       
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipValue = defaults.integerForKey("defaultTip")
        
        settingsTipControl.selectedSegmentIndex = defaultTipValue
        println("Default value is => \(defaultTipValue)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    @IBAction func tipSettingsChanged(sender: AnyObject) {
        var index = settingsTipControl.selectedSegmentIndex
        println("Value is \(index)")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("\(index)", forKey: "defaultTip")
        defaults.synchronize()
    }

}
