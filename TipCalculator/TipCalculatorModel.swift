//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jonathan Chiam on 29/2/16.
//  Copyright © 2016 Jonathan Chiam. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    
    
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    func printPossibleTips() {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        for possibleTip in possibleTipsInferred {
            print("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
        }
    }
}