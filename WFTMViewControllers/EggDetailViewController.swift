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
    
    var currentEgg: WFTMModel.Egg!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        eggImage = currentEgg.image
//        eggLevel = currentEgg.level
//        eggType = currentEgg.type
        
        eggImageView.image = currentEgg.image
        typeLabel.text = "Type -> \(currentEgg.type)"
        levelLabel.text = "Level - > \(String(currentEgg.level))"
        
        
    }
    
}
