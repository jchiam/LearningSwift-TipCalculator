//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jonathan Chiam on 29/2/16.
//  Copyright © 2016 Jonathan Chiam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }

    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        var keys = Array(possibleTips.keys)
        keys.sortInPlace()
        for tipPct in keys {
            let (tipValue, total) = possibleTips[tipPct]!
            let prettyTipValue = String(format: "%0.2f", tipValue)
            let prettyTotal = String(format: "%0.2f", total)
            results += "\(tipPct)%: \(prettyTipValue)\tTotal: \(prettyTotal)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
}

