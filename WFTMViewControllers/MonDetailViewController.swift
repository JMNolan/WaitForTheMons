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
import Social

class MonDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var monImage: UIImageView!
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
        nameText.text = "Name: \(currentMon.name!)"
        typeText.text = "Type: \(currentMon.type!)"
        hatchDateText.text = "Date Hatched: \(currentMon.creationDate!)"
        
    }
    
    @IBAction func mainMenuPressed() {
        let mainMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        mainMenuVC.dataController = self.dataController
        self.present(mainMenuVC, animated: true, completion: nil)
    }
    
    @IBAction func allMonsPressed() {
        let allMonsVC = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
        allMonsVC.dataController = self.dataController
        self.present(allMonsVC, animated: true, completion: nil)
    }
    
    @IBAction func changeNamePressed(_ sender: Any) {
        let alert = UIAlertController(title: "Name your Mon", message: "Enter a name for your Mon", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.text = "New Name"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak alert] (_) in
            let newName = alert?.textFields![0].text
            self.currentMon.name = newName
            self.nameText.text = "Name: \(self.currentMon.name!)"
            try? self.dataController.viewContext.save()
            print("Name Selected")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sharePressed(_ sender: Any) {
//        let alert = UIAlertController(title: "Share", message: "Share Your Mon!", preferredStyle: .actionSheet)
//        let facebookShareAction = UIAlertAction(title: "Share on Facebook", style: .default, handler: { (action) in
//            let post = SLComposeViewController(forServiceType: )
//            print("success")
//        })
//        alert.addAction(facebookShareAction)
//        self.present(alert, animated: true, completion: nil)
        let imageToShare = UIImage(data: self.currentMon.image!)
        let share: [Any] = [imageToShare!]
        let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
