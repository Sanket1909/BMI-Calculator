//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func heightSlider(_ sender: UISlider) {
       let hight =  String(format: "%.2f", sender.value)
        heightLabel.text = "\(hight)m"
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight =  String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
  
    }
    @IBAction func buttonPressd(_ sender: UIButton) {
        let hight = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(hight:hight,weight:weight)
        
        
        self.performSegue(withIdentifier: "ToShowResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToShowResult" {
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.bmiValue = calculatorBrain.getBMIValue()
            destinationVc.advice = calculatorBrain.getAdvice()
            destinationVc.color = calculatorBrain.getColor()
        }
    }
}

