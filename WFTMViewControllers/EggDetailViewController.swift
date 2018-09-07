//
//  EggDetailViewController.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/15/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EggDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var eggImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var beginHatchButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var levelOneTimer: Int = 3600
    var levelTwoTimer: Int = 7200
    var levelThreeTimer: Int = 14400
    var levelFourTimer: Int = 28800
    var timer = Timer()
    var timeRemaining: Int!
    var timerIsRunning = false
    
    var currentEgg: WFTMModel.Egg!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timeRemaining = determineTime()
        timeRemaining = 10
        eggImageView.image = currentEgg.image
        typeLabel.text = "Type -> \(currentEgg.type!)"
        levelLabel.text = "Level - > \(String(currentEgg.level!))"
    }
    // MARK: IBActions
    
    @IBAction func beginHatchTapped() {
        if !timerIsRunning {
            beginHatch()
        }
    }
    
    // MARK: Functions
    
    func disableHatchButton() {
        self.beginHatchButton.isEnabled = false
        DispatchQueue.main.async {
            self.beginHatchButton.titleLabel?.text = "Hatching..."
        }
    }
    
    func enableHatchButton() {
        self.beginHatchButton.isEnabled = true
        DispatchQueue.main.async {
            self.beginHatchButton.titleLabel?.text = "Begin Hatching"
        }
    }
    
    func showHatchedMon() {
        //TODO: randomly generate a mon from that type/level, send info to MonDetailViewController, present MonDetailViewController
    }
    
    func cancelHatch() {
        timer.invalidate()
        enableHatchButton()
        //TODO: display message telling user that the hatch failed and upon tapping ok take user back to egg selection view
    }
    
    func beginHatch() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunning = true
        disableHatchButton()
    }
    
    @objc func updateTimer() {
        if timeRemaining < 1 {
            timer.invalidate()
            showHatchedMon()
            timerIsRunning = false
            self.timeRemaining = 10
            enableHatchButton()
        } else {
            timeRemaining! -= 1
            timerLabel.text = timeString(time: TimeInterval(timeRemaining))
        }
    }
    
    func timeString(time: TimeInterval) -> String{
        let hours = Int(time)/3600
        let minutes = Int(time)/60%60
        let seconds = Int(time)%60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func determineTime() -> Int {
        if currentEgg.level == 1 {
            return levelOneTimer
        } else {
            if currentEgg.level == 2 {
                return levelTwoTimer
            } else {
                if currentEgg.level == 3 {
                    return levelThreeTimer
                } else {
                    return levelFourTimer
                }
            }
        }
    }
    
}
