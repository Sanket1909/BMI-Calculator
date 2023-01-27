//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sanket Patel  on 2023-01-23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi:BMI?
    func getBMIValue() -> String {
        let bmiToDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimal
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    mutating func calculateBMI(hight:Float,weight:Float){
    let bmiValue = weight/(hight*hight)
        if bmiValue  < 18.5 {
            bmi = BMI(value: bmiValue, advice: "EAT More Pies!", color:UIColor.blue)
            
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit As Fiddle!", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat Less Pies!", color:UIColor.red )
        }
}
}
