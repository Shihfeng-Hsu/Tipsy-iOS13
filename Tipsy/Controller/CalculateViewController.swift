//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculateBrain = CalculateBrain()
    var calculatedResult = 0.0
    
    @IBOutlet weak var InputTextField: UITextField!
    @IBOutlet weak var Tax0Button: UIButton!
    @IBOutlet weak var Tax10Button: UIButton!
    @IBOutlet weak var Tax20Button: UIButton!
    @IBOutlet weak var SplitNumberLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //To avoid invalid value like "005281", and change it to "5281"
    @IBAction func InputCorrected(_ sender: UITextField) {
        let correctNumber:Int = Int( InputTextField.text!) ?? 0
        InputTextField.text = String(correctNumber)
        
    }
    
    @IBAction func CalculateButtonPressed(_ sender: UIButton) {
        
        let amount = InputTextField.text ?? "0.0"
        
        calculatedResult = calculateBrain.calculate(amount: amount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
    }
  
    
    @IBAction func TaxButtonPress(_ sender: UIButton) {
        view.self.endEditing(true)
        
        calculateBrain.setTexPrecentage(tex: sender.currentTitle!)
        
        
        if sender.currentTitle! == " 0%"{
            Tax0Button!.isSelected = true
            Tax10Button!.isSelected = false
            Tax20Button!.isSelected = false

        }else if sender.currentTitle! == "10%"{
            Tax0Button!.isSelected = false
            Tax10Button!.isSelected = true
            Tax20Button!.isSelected = false

        }else {
            Tax0Button!.isSelected = false
            Tax10Button!.isSelected = false
            Tax20Button!.isSelected = true

        }
        
    }
    
    @IBAction func SplitStepper(_ sender: UIStepper) {
        let stepperValue = sender.value
        SplitNumberLabel.text = String(format:"%.0f" ,stepperValue)
        
        calculateBrain.setSplit(split: stepperValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            print(Int(calculateBrain.getSplit()))
            print(calculateBrain.getTexPrecentage())
            
            destinationVC.average = calculatedResult
            destinationVC.splitPerson = Int(calculateBrain.getSplit())
            destinationVC.taxPercentage = calculateBrain.getTexPrecentage()
        }
    }
    
}

