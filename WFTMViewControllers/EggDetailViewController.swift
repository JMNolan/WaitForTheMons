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
    
    var dataController: DataController!
    var levelOneTimer: Int = 3600
    var levelTwoTimer: Int = 7200
    var levelThreeTimer: Int = 14400
    var levelFourTimer: Int = 28800
    var timer = Timer()
    var timeRemaining: Int!
    var timerIsRunning = false
    
    var currentEgg: WFTMModel.Egg!
    var hatchedMon: WFTMModel.Mon!

    
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
    
    //picks random mon from array of mon structs
    func selectRandomMon(monArray: [WFTMModel.Mon]) -> WFTMModel.Mon {
        let count = monArray.count
        let randomIndex = arc4random_uniform(UInt32(count))
        return monArray[Int(randomIndex)]
    }
    
    //uses level and type to find the correct mon array to pull from
    func hatchRandomMon(level: Int, type: String) -> WFTMModel.Mon {
        switch level {
        case 1:
            switch type {
            case "Fire":
                let array = MonLibrary.level1FireMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Plant":
                let array = MonLibrary.level1PlantMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Water":
                let array = MonLibrary.level1WaterMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Bird":
                let array = MonLibrary.level1BirdMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Electric":
                let array = MonLibrary.level1ElectricMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Insect":
                let array = MonLibrary.level1PlantMon
                let mon = selectRandomMon(monArray: array)
                return mon
            default:
                return WFTMModel.Mon(level: 0, type: nil, name: nil, image: nil)
            }
        case 2:
            switch type {
            case "Fire":
                let array = MonLibrary.level2FireMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Plant":
                let array = MonLibrary.level2PlantMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Water":
                let array = MonLibrary.level2WaterMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Bird":
                let array = MonLibrary.level2BirdMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Electric":
                let array = MonLibrary.level2ElectricMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Insect":
                let array = MonLibrary.level2InsectMon
                let mon = selectRandomMon(monArray: array)
                return mon
            default:
                return WFTMModel.Mon(level: 0, type: nil, name: nil, image: nil)
            }
        case 3:
            switch type {
            case "Fire":
                let array = MonLibrary.level3FireMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Plant":
                let array = MonLibrary.level3PlantMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Water":
                let array = MonLibrary.level3WaterMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Bird":
                let array = MonLibrary.level3BirdMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Electric":
                let array = MonLibrary.level3ElectricMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Insect":
                let array = MonLibrary.level3InsectMon
                let mon = selectRandomMon(monArray: array)
                return mon
            default:
                return WFTMModel.Mon(level: 0, type: nil, name: nil, image: nil)
            }
        case 4:
            switch type {
            case "Fire":
                let array = MonLibrary.level4FireMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Plant":
                let array = MonLibrary.level4PlantMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Water":
                let array = MonLibrary.level4WaterMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Bird":
                let array = MonLibrary.level4BirdMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Electric":
                let array = MonLibrary.level4ElectricMon
                let mon = selectRandomMon(monArray: array)
                return mon
            case "Insect":
                let array = MonLibrary.level4InsectMon
                let mon = selectRandomMon(monArray: array)
                return mon
            default:
                return WFTMModel.Mon(level: 0, type: nil, name: nil, image: nil)
            }
        default:
            return WFTMModel.Mon(level: 0, type: nil, name: nil, image: nil)
        }
    }
    
    //Create Mon, save it to persistent store, and pass it to MonDetailViewController to be shown as hatched mon
    func showHatchedMon() {
        let monDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "MonDetailViewController") as! MonDetailViewController
        let hatchedMon = hatchRandomMon(level: self.currentEgg.level, type: self.currentEgg.type)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let todaysDate = formatter.string(from: date)
        let newMon = Mon(context: dataController.viewContext)
        newMon.creationDate = todaysDate
//        print("The creation date is: \(String(describing: newMon.creationDate!))")
        newMon.level = Int32(hatchedMon.level)
//        print("The level is: \(newMon.level)")
        newMon.name = hatchedMon.name!
//        print("The name is: \(String(describing: newMon.name!))")
        newMon.type = hatchedMon.type!
//        print("The type is: \(String(describing: newMon.type!))")
        newMon.image = hatchedMon.image!
        print("the mon image is: \(String(describing: newMon.image!))")
        try? dataController.viewContext.save()
        monDetailVC.dataController = self.dataController
        monDetailVC.currentMon = newMon
        present(monDetailVC, animated: true, completion: nil)
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

