//
//  ViewController.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/13/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//
import Foundation
import UIKit
import CoreData
import FBSDKLoginKit

class MainMenuViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var monsButton: UIButton!
    @IBOutlet weak var eggsButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var loginActivityIndicator: UIActivityIndicatorView!
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        view.addSubview(loginButton)
        setFBLoginButtonConstraints(button: loginButton)
        loginActivityIndicator.isHidden = true
        formatButtonImages()
        
        //load background from user defaults
        if let background = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.backgroundImageName) {
            let backgroundName = background as! String
            view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        }
        
    }
    
    @IBAction func monsButtonPressed() {
        let monsVC = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
        monsVC.dataController = self.dataController
        self.present(monsVC, animated: true, completion: nil)
    }
    
    @IBAction func eggsButtonPressed() {
        let eggsVC = self.storyboard?.instantiateViewController(withIdentifier: "EggSelectionViewController") as! EggSelectionViewController
        eggsVC.dataController = self.dataController
        self.present(eggsVC, animated: true, completion: nil)
    }
    
    @IBAction func backgroundButtonPressed() {
        
        //presents alert allowing user to change background of the app
        let alert = UIAlertController(title: "Select Background", message: "Choose a background image to use throughout the app", preferredStyle: .actionSheet)
        let actionGrass = UIAlertAction(title: "Grass", style: .default, handler: {action in
            let backgroundName: String = "grassTile"
            UserDefaults.standard.set(backgroundName, forKey: WFTMModel.userDefaultStrings.backgroundImageName)
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        })
        let actionWater = UIAlertAction(title: "Water", style: .default, handler: {action in
            let backgroundName: String = "waterTile"
            UserDefaults.standard.set(backgroundName, forKey: WFTMModel.userDefaultStrings.backgroundImageName)
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        })
        let actionLava = UIAlertAction(title: "Lava", style: .default, handler: {action in
            let backgroundName: String = "lavaTile1"
            UserDefaults.standard.set(backgroundName, forKey: WFTMModel.userDefaultStrings.backgroundImageName)
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        })
        let actionSky = UIAlertAction(title: "Sky", style: .default, handler: {action in
            let backgroundName: String = "skyTile"
            UserDefaults.standard.set(backgroundName, forKey: WFTMModel.userDefaultStrings.backgroundImageName)
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        })
        alert.addAction(actionGrass)
        alert.addAction(actionWater)
        alert.addAction(actionLava)
        alert.addAction(actionSky)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setFBLoginButtonConstraints(button: UIView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: backgroundButton.bottomAnchor, constant: 30).isActive = true
        button.widthAnchor.constraint(equalTo: (monsButton.imageView?.widthAnchor)!, multiplier: 0.75).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func formatButtonImages() {
        self.monsButton.imageView?.contentMode = .scaleAspectFill
        self.eggsButton.imageView?.contentMode = .scaleAspectFill
        self.backgroundButton.imageView?.contentMode = .scaleAspectFill
    }
    
    //MARK: Facebook Login Button Delegate Methods
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        self.loginActivityIndicator.isHidden = false
        
        if error != nil {
            print(error)
            self.loginActivityIndicator.isHidden = true
            return
        }
        
        if result != nil {
            self.loginActivityIndicator.isHidden = true
        }
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }

}

