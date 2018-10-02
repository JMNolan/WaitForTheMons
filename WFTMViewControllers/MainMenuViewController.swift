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
    @IBOutlet weak var soundButton: UIButton!
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        view.addSubview(loginButton)
        setFBLoginButtonConstraints(button: loginButton)
        
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
        //TODO: select the background to appear behind the mon collectionView
    }
    
    @IBAction func soundButtonPressed() {
        //TODO: turn off any sound in the game if sound is added
    }
    
    func setFBLoginButtonConstraints(button: UIView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: soundButton.bottomAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: Facebook Login Button Delegate Methods
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged into facebook")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }

}

