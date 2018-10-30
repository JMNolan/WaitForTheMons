//
//  WFTMModel.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class WFTMModel {
    
    //Egg arrays to populate egg collection views in EggSelectionViewController
    static let levelOneEggs = [
        EggLibrary.levelOneFireEgg ,
        EggLibrary.levelOnePlantEgg,
        EggLibrary.levelOneWaterEgg,
        EggLibrary.levelOneBirdEgg,
        EggLibrary.levelOneInsectEgg
        ]
    
    static let levelTwoEggs = [
        EggLibrary.levelTwoFireEgg,
        EggLibrary.levelTwoPlantEgg,
        EggLibrary.levelTwoWaterEgg,
        EggLibrary.levelTwoBirdEgg,
        EggLibrary.levelTwoInsectEgg
        ]
    
    static let levelThreeEggs = [
        EggLibrary.levelThreeFireEgg,
        EggLibrary.levelThreePlantEgg,
        EggLibrary.levelThreeWaterEgg,
        EggLibrary.levelThreeBirdEgg,
        EggLibrary.levelThreeInsectEgg
        ]
    
    static let levelFourEggs = [
        EggLibrary.levelFourFireEgg,
        EggLibrary.levelFourPlantEgg,
        EggLibrary.levelFourWaterEgg,
        EggLibrary.levelFourBirdEgg,
        EggLibrary.levelFourInsectEgg
        ]
    
    //strings for user default properties
    struct userDefaultStrings {
        static var eggIsHatching: String = "Egg Is Hatching"
        static var showEggAtLaunch: String = "Show Egg At Launch"
        static var newTime: String = "New Time"
        static var lastTime: String = "Last Time"
        static var remainingTime: String = "Remaining Time"
        static var lastEggLevel: String = "Last Egg Level"
        static var lastEggType: String = "Last Egg Type"
        static var lastEggImage: String = "Last Egg Image"
        static var userLeftApp: String = "User Left App"
    }
    
    
}
