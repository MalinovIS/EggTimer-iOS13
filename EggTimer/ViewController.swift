//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    let eggTimes = ["Soft":180.0,"Medium":240.0,"Hard":420.0]
    
    var totalTime = 0.0
    var secondsPast = 0.0
    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        secondsPast = eggTimes[hardness]!
        totalTime = secondsPast
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer () {
        if secondsPast > 0 {
            progressBar.progress += Float(1.0/totalTime)
            infoLabel.text = "\(secondsPast) seconds"
            secondsPast -= 1
        }
        else {
            timer.invalidate()
            infoLabel.text = "Done"
        }
    }
    }
