//
//  ResultViewController.swift
//  Tipsy
//
//  Created by shih-feng on 2023/8/8.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var splitPerson : Int = 0
    var average: Double = 0.0
    var taxPercentage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        averageLabel.text = String(format:"%.1f", average)
        descriptionLabel.text = "Split between \(String(splitPerson)) people, with \(taxPercentage) tip."
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
