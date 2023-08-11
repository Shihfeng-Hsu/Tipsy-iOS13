//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by shih-feng on 2023/8/9.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    
    var texPrecentage:Double = 1.1
    var split:Double = 2.0
    
    
    mutating func setTexPrecentage(tex:String){
        switch tex {
        case "10%":
            self.texPrecentage = 1.1
        case"20%":
            self.texPrecentage = 1.2
        case " 0%":
            self.texPrecentage = 1
        default:
            self.texPrecentage = 1.1
        }
        
    }
    
    mutating func setSplit(split:Double){
        self.split = split
    }
    
    func calculate(amount:String) -> Double{
        
        let amountNumber = Double(amount) ?? 0
        let amountTaxAdded = amountNumber * texPrecentage
        let result = amountTaxAdded / split

        return result
    }
    
    func getSplit() -> Double{
        return self.split
    }
    func getTexPrecentage() -> String{
        if texPrecentage == 1.1 {
            return "10%"
        } else if texPrecentage == 1.2 {
            return "20%"
        } else {
            return "0%"
        }
    }
    
    
    
}
