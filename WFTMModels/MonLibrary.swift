//
//  MonLibrary.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

//list of all Mons
let blastoise = WFTMModel.Mon.init(level: 3, type: "Water", name: "Blastoise", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Blastoise")))
let bulbasaur = WFTMModel.Mon.init(level: 1, type: "Plant", name: "Bulbasaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Bulbasaur")))
let butterfree = WFTMModel.Mon.init(level: 3, type: "Insect", name: "Butterfree", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Butterfree")))
let caterpie = WFTMModel.Mon.init(level: 1, type: "Insect", name: "Caterpie", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Caterpie")))
let charizard = WFTMModel.Mon.init(level: 3, type: "Fire", name: "Charizard", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charizard")))
let charmander = WFTMModel.Mon.init(level: 1, type: "Fire", name: "Charmander", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charmander")))
let charmeleon = WFTMModel.Mon.init(level: 2, type: "Fire", name: "Charmeleon", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charmeleon")))
let ivysaur = WFTMModel.Mon.init(level: 2, type: "Plant", name: "Ivysaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Ivysaur")))
let megaBlastoise = WFTMModel.Mon.init(level: 4, type: "Water", name: "Mega Blastoise", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaBlastoise")))
let megaCharizard = WFTMModel.Mon.init(level: 4, type: "Fire", name: "Mega Charizard", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaCharizard")))
let megaPidgeot = WFTMModel.Mon.init(level: 4, type: "Bird", name: "Mega Pidgeot", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaPidgeot")))
let metapod = WFTMModel.Mon.init(level: 2, type: "Insect", name: "Metapod", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Metapod")))
let pidgeot = WFTMModel.Mon.init(level: 3, type: "Bird", name: "Pidgeot", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgeot")))
let pidgeotto = WFTMModel.Mon.init(level: 2, type: "Bird", name: "Pidgeotto", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgeotto")))
let pidgy = WFTMModel.Mon.init(level: 1, type: "Bird", name: "Pidgy", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgey")))
let pikachu = WFTMModel.Mon.init(level: 2, type: "Electric", name: "Pikachu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pikachu")))
let raichu = WFTMModel.Mon.init(level: 3, type: "Electric", name: "Raichu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Raichu")))
let squirtle = WFTMModel.Mon.init(level: 1, type: "Water", name: "Squirtle", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Squirtle")))
let venusaur = WFTMModel.Mon.init(level: 3, type: "Plant", name: "Venusaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Venusaur")))
let wartortle = WFTMModel.Mon.init(level: 2, type: "Water", name: "Wartortle", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Wartortle")))

class MonLibrary: NSObject {
    
    //level1 water
    static let level1WaterMon = [
        squirtle
    ]
    
    //level2 water
    static let level2WaterMon = [
        wartortle
    ]
    
    //level 3 water
    static let level3WaterMon = [
        blastoise
    ]
    
    //level 4 water
    static let level4WaterMon = [
        megaBlastoise
    ]
    
    //level 1 fire
    static let level1FireMon = [
        charmander
    ]
    
    //leve 2 fire
    static let level2FireMon = [
        charmeleon
    ]
    
    //level 3 fire
    static let level3FireMon = [
        charizard
    ]
    
    //level 4 fire
    static let level4FireMon = [
        megaCharizard
    ]
    
    //level 1 plant
    static let level1PlantMon = [
        bulbasaur
    ]
    
    //level 2 plant
    static let level2PlantMon = [
        ivysaur
    ]
    
    //level 3 plant
    static let level3PlantMon = [
        venusaur
    ]
    
    //level 4 plant
    static let level4PlantMon: [
        WFTMModel.Mon
        ] = []
    
    //level 1 electric
    static let level1ElectricMon: [
        WFTMModel.Mon
        ] = []
    
    //level 2 electric
    static let level2ElectricMon = [
        pikachu
    ]
    
    //level 3 electric
    static let level3ElectricMon = [
        raichu
    ]
    
    //level 4 electric
    static let level4ElectricMon: [
        WFTMModel.Mon
        ] = []
    
    //level 1 bird
    static let level1BirdMon = [
        pidgy
    ]
    
    //level 2 bird
    static let level2BirdMon = [
        pidgeotto
    ]
    
    //level 3 bird
    static let level3BirdMon = [
        pidgeot
    ]
    
    //level 4 bird
    static let level4BirdMon = [
        megaPidgeot
    ]
    
    //level 1 insect
    static let level1InsectMon = [
        caterpie
    ]
    
    //level 2 insect
    static let level2InsectMon = [
        metapod
    ]
    
    //level 3 insect
    static let level3InsectMon = [
        butterfree
    ]
    
    //level 4 insect
    static let level4InsectMon: [
        WFTMModel.Mon
    ] = []
}
