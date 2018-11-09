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
import FBSDKShareKit

class MonDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var monImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var typeText: UILabel!
    @IBOutlet weak var hatchDateText: UILabel!
    @IBOutlet weak var mainMenuButton: UIBarButtonItem!
    @IBOutlet weak var allMonsButton: UIBarButtonItem!
    @IBOutlet weak var changeNameButton: UIButton!
    
    
    var currentMon: Mon!
    var monName: String!
    var monType: String!
    var hatchDate: Date!
    var dataController: DataController!
    let shareButton = FBSDKShareButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monImage.image = UIImage(data: currentMon.image!)
        nameText.text = "Name: \(currentMon.name!)"
        typeText.text = "Type: \(currentMon.type!)"
        hatchDateText.text = "Date Hatched: \(currentMon.creationDate!)"
        createShareButton()
        
        //set background from user defaults
        if let background = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.backgroundImageName) {
            let backgroundName = background as! String
            view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        }
    }
    
    @IBAction func allMonsPressed() {
        if WFTMModel.allMonsInstantiated {
            performSegue(withIdentifier: "UnwindToAllMons", sender: self)
        } else {
            WFTMModel.allMonsInstantiated = true
            performSegue(withIdentifier: "ToAllMons", sender: self)
        }
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
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainMenuVC = segue.destination as? MainMenuViewController {
            WFTMModel.allMonsInstantiated = false
            WFTMModel.eggSelectionInstantiated = false
            mainMenuVC.dataController = self.dataController
        }
        
        if let allMonsVC = segue.destination as? AllMonsViewController {
            allMonsVC.dataController = self.dataController
        }
    }
    
    @objc func createShareButton() {
        let imageToShare = UIImage(data: self.currentMon.image!)
        let fbImage = FBSDKSharePhoto(image: imageToShare!, userGenerated: false)
        let photo = FBSDKSharePhotoContent()
        photo.photos = [fbImage!]
        shareButton.shareContent = photo
        
        view.addSubview(shareButton)
        
        //set constraints for share button
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.topAnchor.constraint(equalTo: changeNameButton.bottomAnchor, constant: 10).isActive = true
        shareButton.widthAnchor.constraint(equalTo: changeNameButton.widthAnchor, multiplier: 1.0).isActive = true
        shareButton.centerXAnchor.constraint(equalTo: hatchDateText.centerXAnchor).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
