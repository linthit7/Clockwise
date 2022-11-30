//
//  ViewController.swift
//  Clockwise
//
//  Created by Lin Thit Khant on 11/29/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .countDownTimer
        
    }

    @IBAction func startCountDown(_ sender: UIButton) {
        
        performSegue(withIdentifier: "mainToCount", sender: self)
        
        print(datePicker.countDownDuration)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let countVC = segue.destination as! CountViewController
    
        countVC.totalSeconds = Int(datePicker.countDownDuration)
    }
    
    
}

