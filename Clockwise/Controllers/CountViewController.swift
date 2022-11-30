//
//  CountViewController.swift
//  Clockwise
//
//  Created by Lin Thit Khant on 11/29/22.
//

import UIKit
import AVFoundation

class CountViewController: UIViewController {
    
    @IBOutlet weak var timeS: UILabel!
    
    var totalSeconds: Int = 5
    var alarmFile: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer()
        
    }
    
    func popUpAlert() {
        let alertView = UIAlertController(title: "Count Down Done!", message: nil, preferredStyle: .actionSheet)
        
        let alertAction = UIAlertAction(title: "Done", style: .default) { _ in
            
            alertView.dismiss(animated: true)
            self.timerDone()
            
            
        }
        alertView.addAction(alertAction)
        
        present(alertView, animated: true)
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.totalSeconds > 0 {
                self.totalSeconds = self.totalSeconds - 1
                self.timeS.text = String(self.totalSeconds) + " s"
                
            } else {
                timer.invalidate()
                self.alarmSound()
                self.popUpAlert()
            }
        }
        
    }
    
    func timerDone() {
            self.dismiss(animated: true)
            self.alarmFile?.stop()
    }
    
    func alarmSound() {
        
        guard let path = Bundle.main.path(forResource: "mixkit-classic-alarm-995", ofType: "wav") else {
            print("Error getting audio file path.")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            alarmFile = try AVAudioPlayer(contentsOf: url)
            alarmFile?.play()
        } catch {
            print(error)
        }
    }
}
