//
//  MonDetailViewController.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/15/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MonDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var monImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var hatchDateLabel: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var typeText: UILabel!
    @IBOutlet weak var hatchDateText: UILabel!
    @IBOutlet weak var mainMenuButton: UIBarButtonItem!
    @IBOutlet weak var allMonsButton: UIBarButtonItem!
    
    var currentMon: Mon!
    var monName: String!
    var monType: String!
    var hatchDate: Date!
    var dataController: DataController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monImage.image = UIImage(data: currentMon.image!)
        nameText.text = currentMon.name
        typeText.text = currentMon.type
        hatchDateText.text = currentMon.creationDate
        
    }
    
    @IBAction func mainMenuPressed() {
        let mainMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "mainMenuViewController") as! MainMenuViewController
        mainMenuVC.dataController = self.dataController
        self.present(mainMenuVC, animated: true, completion: nil)
    }
    
    @IBAction func allMonsPressed() {
        let allMonsVC = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
        allMonsVC.dataController = self.dataController
        self.present(allMonsVC, animated: true, completion: nil)
    }
    
}
