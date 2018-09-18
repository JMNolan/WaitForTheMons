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

class MainMenuViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var monsButton: UIButton!
    @IBOutlet weak var eggsButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func monsButtonPressed() {
        let monsVC = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
        monsVC.dataController = self.dataController
        navigationController?.pushViewController(monsVC, animated: true)
    }
    
    @IBAction func eggsButtonPressed() {
        let eggsVC = self.storyboard?.instantiateViewController(withIdentifier: "EggSelectionViewController") as! EggSelectionViewController
        eggsVC.dataController = self.dataController
        navigationController?.pushViewController(eggsVC, animated: true)
    }
    
    @IBAction func backgroundButtonPressed() {
        //TODO: select the background to appear behind the mon collectionView
    }
    
    @IBAction func soundButtonPressed() {
        //TODO: turn off any sound in the game if sound is added
    }

}

