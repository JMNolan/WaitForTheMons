//
//  MonLibrary.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation

//list of all Mons
let blastoise = WFTMModel.Mon.init(level: 3, type: "water", name: "Blastoise")
let bulbasaur = WFTMModel.Mon.init(level: 1, type: "plant", name: "Bulbasaur")
let butterfree = WFTMModel.Mon.init(level: 3, type: "insect", name: "Butterfree")
let caterpie = WFTMModel.Mon.init(level: 1, type: "insect", name: "Caterpie")
let charizard = WFTMModel.Mon.init(level: 3, type: "fire", name: "Charizard")
let charmander = WFTMModel.Mon.init(level: 1, type: "fire", name: "Charmander")
let charmeleon = WFTMModel.Mon.init(level: 2, type: "fire", name: "Charmeleon")
let ivysaur = WFTMModel.Mon.init(level: 2, type: "plant", name: "Ivysaur")
let megaBlastoise = WFTMModel.Mon.init(level: 4, type: "water", name: "Mega Blastoise")
let megaCharizard = WFTMModel.Mon.init(level: 4, type: "fire", name: "Mega Charizard")
let megaPidgeot = WFTMModel.Mon.init(level: 4, type: "bird", name: "Mega Pidgeot")
let metapod = WFTMModel.Mon.init(level: 2, type: "insect", name: "Metapod")
let pidgeot = WFTMModel.Mon.init(level: 3, type: "bird", name: "Pidgeot")
let pidgeotto = WFTMModel.Mon.init(level: 2, type: "bird", name: "Pidgeotto")
let pidgy = WFTMModel.Mon.init(level: 1, type: "bird", name: "Pidgy")
let pikachu = WFTMModel.Mon.init(level: 2, type: "electric", name: "Pikachu")
let raichu = WFTMModel.Mon.init(level: 3, type: "electric", name: "Raichu")
let squirtle = WFTMModel.Mon.init(level: 1, type: "water", name: "Squirtle")
let venusaur = WFTMModel.Mon.init(level: 3, type: "plant", name: "Venusaur")
let wartortle = WFTMModel.Mon.init(level: 2, type: "water", name: "Wartortle")

class MonLibrary: NSObject {
    
    //level1 water
    let level1WaterMon = [
        squirtle
    ]
    
    //level2 water
    let level2WaterMon = [
        wartortle
    ]
    
    //level 3 water
    let level3WaterMon = [
        blastoise
    ]
    
    //level 4 water
    let level4WaterMon = [
        megaBlastoise
    ]
    
    //level 1 fire
    let level1FireMon = [
        charmander
    ]
    
    //leve 2 fire
    let level2FireMon = [
        charmeleon
    ]
    
    //level 3 fire
    let level3FireMon = [
        charizard
    ]
    
    //level 4 fire
    let level4FireMon = [
        megaCharizard
    ]
    
    //level 1 plant
    let level1PlantMon = [
        bulbasaur
    ]
    
    //level 2 plant
    let level2PlantMon = [
        ivysaur
    ]
    
    //level 3 plant
    let level3PlantMon = [
        venusaur
    ]
    
    //level 4 plant
    let level4PlantMon: [
        WFTMModel.Mon
        ] = []
    
    //level 1 electric
    let level1ElectricMon: [
        WFTMModel.Mon
        ] = []
    
    //level 2 electric
    let level2ElectricMon = [
        pikachu
    ]
    
    //level 3 electric
    let level3ElectricMon = [
        raichu
    ]
    
    //level 4 electric
    let level4Electric: [
        WFTMModel.Mon
        ] = []
    
    //level 1 bird
    let level1BirdMon = [
        pidgy
    ]
    
    //level 2 bird
    let level2BirdMon = [
        pidgeotto
    ]
    
    //level 3 bird
    let level3BirdMon = [
        pidgeot
    ]
    
    //level 4 bird
    let level4BirdMon = [
        megaPidgeot
    ]
    
    //level 1 insect
    let level1InsectMon = [
        caterpie
    ]
    
    //level 2 insect
    let level2InsectMon = [
        metapod
    ]
    
    //level 3 insect
    let level3InsectMon = [
        butterfree
    ]
    
    //level 4 insect
    let level4InsectMon: [
        WFTMModel.Mon
    ] = []
}
