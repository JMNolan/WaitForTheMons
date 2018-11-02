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
    @IBOutlet weak var cancelButton: UIButton!
    
    
    // MARK: Properties
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
    
        //Add notification center observers for the app resigning active and becoming active
        NotificationCenter.default.addObserver(self, selector: #selector(resignedActive), name: .UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(becameActive), name: .UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userLeftApp), name: .UIApplicationDidEnterBackground , object: nil)
        
//        timeRemaining = determineTime()
        //MARK: ForTesting: Comment out line above here and uncomment line below for a short timer for testing
        timeRemaining = 10
        eggImageView.image = currentEgg.image
        typeLabel.text = "Type -> \(currentEgg.type!)"
        levelLabel.text = "Level - > \(String(currentEgg.level!))"
        cancelButton.setTitle("Back", for: .normal)
        
        //set background from user defaults
        if let background = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.backgroundImageName) {
            let backgroundName = background as! String
            view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        //remove notification center observers that were added in viewDidLoad
        NotificationCenter.default.removeObserver(self, name: .UIApplicationWillResignActive , object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIApplicationDidBecomeActive , object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIApplicationDidEnterBackground , object: nil)
    }
    // MARK: IBActions
    @IBAction func beginHatchTapped() {
        if !timerIsRunning {
            beginHatch()
            cancelButton.titleLabel?.text = "Cancel"
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        if cancelButton.titleLabel?.text == "Cancel" {
            cancelHatch()
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EggSelectionViewController") as! EggSelectionViewController
            vc.dataController = self.dataController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    // MARK: Functions
    func disableHatchButton() {
        self.beginHatchButton.isEnabled = false
        self.beginHatchButton.titleLabel?.text = "Hatching..."
    }
    
    func enableHatchButton() {
        self.beginHatchButton.isEnabled = true
        self.beginHatchButton.titleLabel?.text = "Begin Hatching"
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
                let array = MonLibrary.level1InsectMon
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
        formatter.dateFormat = "MM/dd/yyyy"
        let todaysDate = formatter.string(from: date)
        let newMon = Mon(context: dataController.viewContext)
        newMon.creationDate = todaysDate
        newMon.level = Int32(hatchedMon.level)
        newMon.name = hatchedMon.name!
        newMon.type = hatchedMon.type!
        newMon.image = hatchedMon.image!
        try? dataController.viewContext.save()
        monDetailVC.dataController = self.dataController
        monDetailVC.currentMon = newMon
        present(monDetailVC, animated: true, completion: nil)
    }
    
    func cancelHatch() {
        timer.invalidate()
        enableHatchButton()
        UserDefaults.standard.set(false, forKey: WFTMModel.userDefaultStrings.eggIsHatching)
        UserDefaults.standard.set(false, forKey: WFTMModel.userDefaultStrings.userLeftApp)
        
        //provide user with an action sheet to notify them that the hatch failed and give them the option of going to select another egg or viewing all mons
        let alert = UIAlertController(title: "Oops!", message: "Looks like your egg didn't make it. Try another at the egg selection screen.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "New Egg", style: .default, handler: {action in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EggSelectionViewController") as! EggSelectionViewController
            vc.dataController = self.dataController
            self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Mons", style: .default, handler: {action in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
            vc.dataController = self.dataController
            self.present(vc, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func beginHatch() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunning = true
        disableHatchButton()
        UserDefaults.standard.set(true, forKey: WFTMModel.userDefaultStrings.eggIsHatching)
        self.cancelButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        if timeRemaining < 1 {
            timer.invalidate()
            showHatchedMon()
            timerIsRunning = false
            UserDefaults.standard.set(false, forKey: WFTMModel.userDefaultStrings.eggIsHatching)
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
        if !UserDefaults.standard.bool(forKey: WFTMModel.userDefaultStrings.showEggAtLaunch) {
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
        } else {
            let remainingTime = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.newTime) as! Int
            return remainingTime
        }
    }
    
    func backButtonToCancelButton() {
        self.cancelButton.titleLabel?.text = "Cancel"
    }
    
    //save information about the current egg, time, and time remaining
    @objc func resignedActive() {
        let currentTime = Date()
        UserDefaults.standard.set(currentTime, forKey: WFTMModel.userDefaultStrings.lastTime)
        UserDefaults.standard.set(self.timeRemaining, forKey: WFTMModel.userDefaultStrings.remainingTime)
        if let egg = self.currentEgg {
            UserDefaults.standard.set(egg.level, forKey: WFTMModel.userDefaultStrings.lastEggLevel)
            UserDefaults.standard.set(egg.type, forKey: WFTMModel.userDefaultStrings.lastEggType)
            let image = UIImagePNGRepresentation(egg.image)
            UserDefaults.standard.set(image, forKey: WFTMModel.userDefaultStrings.lastEggImage)
        }
    }
    
    @objc func becameActive() {
        if !UserDefaults.standard.bool(forKey: WFTMModel.userDefaultStrings.userLeftApp) {
            let currentTime = Date()
            if let lastTime = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.lastTime) {
                
                //Determines time difference between now and last time active then compare to remaining time on egg hatch last time active
                if let remainingTime = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.remainingTime) {
                    let timeLeft = remainingTime as! Int
                    let time = currentTime.timeIntervalSince(lastTime as! Date)
                    let difference = Int(time)
                    if timeLeft > difference {
                        UserDefaults.standard.set(true, forKey: WFTMModel.userDefaultStrings.eggIsHatching)
                        self.timeRemaining -= difference
                    } else {
                        showHatchedMon()
                    }
                }
            }
        
            if UserDefaults.standard.bool(forKey: WFTMModel.userDefaultStrings.eggIsHatching) {
                let level = UserDefaults.standard.integer(forKey: WFTMModel.userDefaultStrings.lastEggLevel)
                let type = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.lastEggType) as! String
                let imageData = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.lastEggImage) as! Data
                let image = UIImage(data: imageData)
                let egg = WFTMModel.Egg(level: level, type: type, image: image)
                self.currentEgg = egg
            }
        } else {
            cancelHatch()
        }
    }
    
    //runs when user navigates away from the application
    @objc func userLeftApp() {
        UserDefaults.standard.set(true, forKey: WFTMModel.userDefaultStrings.userLeftApp)
    }
    
}

