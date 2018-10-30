//
//  MonLibrary.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

//alphabetical list of all Mons
let ampharos = WFTMModel.Mon.init(level: 4, type: "Electric", name: "Ampharos", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Ampharos")))
let blastoise = WFTMModel.Mon.init(level: 3, type: "Water", name: "Blastoise", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Blastoise")))
let bulbasaur = WFTMModel.Mon.init(level: 1, type: "Plant", name: "Bulbasaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Bulbasaur")))
let butterfree = WFTMModel.Mon.init(level: 3, type: "Insect", name: "Butterfree", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Butterfree")))
let caterpie = WFTMModel.Mon.init(level: 1, type: "Insect", name: "Caterpie", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Caterpie")))
let celebi = WFTMModel.Mon.init(level: 2, type: "Plant", name: "Celebi", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Celebi")))
let charizard = WFTMModel.Mon.init(level: 3, type: "Fire", name: "Charizard", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charizard")))
let charmander = WFTMModel.Mon.init(level: 1, type: "Fire", name: "Charmander", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charmander")))
let charmeleon = WFTMModel.Mon.init(level: 2, type: "Fire", name: "Charmeleon", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Charmeleon")))
let chikorita = WFTMModel.Mon.init(level: 2, type: "Plant", name: "Chikorita", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Chikorita")))
let cyndaquil = WFTMModel.Mon.init(level: 1, type: "Fire", name: "Cyndaquil", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Cyndaquil")))
let darmanitan = WFTMModel.Mon.init(level: 2, type: "Fire", name: "Darmanitan", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Darmanitan")))
let dustox = WFTMModel.Mon.init(level: 1, type: "Insect", name: "Dustox", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Dustox")))
let fennekin = WFTMModel.Mon.init(level: 1, type: "Fire", name: "Fennekin", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Fennekin")))
let fletchinder = WFTMModel.Mon.init(level: 3, type: "Bird", name: "Fletchinder", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Fletchinder")))
let galvantula = WFTMModel.Mon.init(level: 2, type: "Insect", name: "Galvantula", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Galvantula")))
let gogoat = WFTMModel.Mon.init(level: 4, type: "Plant", name: "Gogoat", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Gogoat")))
let grubbin = WFTMModel.Mon.init(level: 1, type: "Insect", name: "Grubbin", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Grubbin")))
let heracross = WFTMModel.Mon.init(level: 3, type: "Insect", name: "Heracross", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Heracross")))
let infernape = WFTMModel.Mon.init(level: 3, type: "Fire", name: "Infernape", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Infernape")))
let ivysaur = WFTMModel.Mon.init(level: 2, type: "Plant", name: "Ivysaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Ivysaur")))
let jolteon = WFTMModel.Mon.init(level: 2, type: "Electric", name: "Jolteon", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Jolteon")))
let lapras = WFTMModel.Mon.init(level: 4, type: "Water", name: "Lapras", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Lapras")))
let leafeon = WFTMModel.Mon.init(level: 3, type: "Plant", name: "Leafeon", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Leafeon")))
let lugia = WFTMModel.Mon.init(level: 4, type: "Bird", name: "Lugia", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Lugia")))
let luxio = WFTMModel.Mon.init(level: 1, type: "Electric", name: "Luxio", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Luxio")))
let luxray = WFTMModel.Mon.init(level: 3, type: "Electric", name: "Luxray", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Luxray")))
let magmar = WFTMModel.Mon.init(level: 2, type: "Fire", name: "Magmar", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Magmar")))
let megaBlastoise = WFTMModel.Mon.init(level: 4, type: "Water", name: "Mega Blastoise", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaBlastoise")))
let megaCharizard = WFTMModel.Mon.init(level: 4, type: "Fire", name: "Mega Charizard", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaCharizard")))
let megaPidgeot = WFTMModel.Mon.init(level: 4, type: "Bird", name: "Mega Pidgeot", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaPidgeot")))
let megaRaichu = WFTMModel.Mon.init(level: 4, type: "Electric", name: "Mega Raichu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaRaichu")))
let megaScizor = WFTMModel.Mon.init(level: 4, type: "Insect", name: "Mega Scizor", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "MegaScizor")))
let metapod = WFTMModel.Mon.init(level: 2, type: "Insect", name: "Metapod", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Metapod")))
let mudkip = WFTMModel.Mon.init(level: 1, type: "Water", name: "Mudkip", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Mudkip")))
let oddish = WFTMModel.Mon.init(level: 1, type: "Plant", name: "Oddish", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Oddish")))
let pachirisu = WFTMModel.Mon.init(level: 1, type: "Electric", name: "Pachirisu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pachirisu.png")))
let pidgeot = WFTMModel.Mon.init(level: 3, type: "Bird", name: "Pidgeot", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgeot")))
let pidgeotto = WFTMModel.Mon.init(level: 2, type: "Bird", name: "Pidgeotto", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgeotto")))
let pidgy = WFTMModel.Mon.init(level: 1, type: "Bird", name: "Pidgy", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pidgey")))
let pikachu = WFTMModel.Mon.init(level: 2, type: "Electric", name: "Pikachu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pikachu")))
let pyroar = WFTMModel.Mon.init(level: 4, type: "Fire", name: "Pyroar", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Pyroar")))
let raichu = WFTMModel.Mon.init(level: 3, type: "Electric", name: "Raichu", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Raichu")))
let rowlet = WFTMModel.Mon.init(level: 1, type: "Bird", name: "Rowlet", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Rowlet")))
let squirtle = WFTMModel.Mon.init(level: 1, type: "Water", name: "Squirtle", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Squirtle")))
let starly = WFTMModel.Mon.init(level: 2, type: "Bird", name: "Starly", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Starly")))
let swello = WFTMModel.Mon.init(level: 3, type: "Bird", name: "Swello", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Swello")))
let totodile = WFTMModel.Mon.init(level: 2, type: "Water", name: "Totodile", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Totodile")))
let vaporeon = WFTMModel.Mon.init(level: 3, type: "Water", name: "Vaporeon", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Vaporeon")))
let venusaur = WFTMModel.Mon.init(level: 3, type: "Plant", name: "Venusaur", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Venusaur")))
let wartortle = WFTMModel.Mon.init(level: 2, type: "Water", name: "Wartortle", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Wartortle")))
let wishiwashi = WFTMModel.Mon.init(level: 1, type: "Water", name: "Wishiwashi", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Wishiwashi.png")))
let zeraora = WFTMModel.Mon.init(level: 3, type: "Electric", name: "Zeraora", image: UIImagePNGRepresentation(#imageLiteral(resourceName: "Zeraora")))

class MonLibrary: NSObject {
    
    //level1 water
    static let level1WaterMon = [
        squirtle,
        mudkip,
        wishiwashi
    ]
    
    //level2 water
    static let level2WaterMon = [
        wartortle,
        totodile
    ]
    
    //level 3 water
    static let level3WaterMon = [
        blastoise,
        vaporeon
    ]
    
    //level 4 water
    static let level4WaterMon = [
        megaBlastoise,
        lapras
    ]
    
    //level 1 fire
    static let level1FireMon = [
        charmander,
        cyndaquil,
        fennekin
    ]
    
    //leve 2 fire
    static let level2FireMon = [
        charmeleon,
        darmanitan,
        magmar
    ]
    
    //level 3 fire
    static let level3FireMon = [
        charizard,
        infernape
    ]
    
    //level 4 fire
    static let level4FireMon = [
        megaCharizard,
        pyroar
    ]
    
    //level 1 plant
    static let level1PlantMon = [
        bulbasaur,
        oddish
    ]
    
    //level 2 plant
    static let level2PlantMon = [
        ivysaur,
        celebi,
        chikorita
    ]
    
    //level 3 plant
    static let level3PlantMon = [
        venusaur,
        leafeon
    ]
    
    //level 4 plant
    static let level4PlantMon = [
        gogoat
    ]
    
    //level 1 electric
    static let level1ElectricMon = [
        luxio,
        pachirisu
    ]
    
    //level 2 electric
    static let level2ElectricMon = [
        pikachu,
        jolteon
    ]
    
    //level 3 electric
    static let level3ElectricMon = [
        raichu,
        luxray,
        zeraora
    ]
    
    //level 4 electric
    static let level4ElectricMon = [
        ampharos,
        megaRaichu
    ]
    
    //level 1 bird
    static let level1BirdMon = [
        pidgy,
        rowlet
    ]
    
    //level 2 bird
    static let level2BirdMon = [
        pidgeotto,
        starly
    ]
    
    //level 3 bird
    static let level3BirdMon = [
        pidgeot,
        fletchinder,
        swello
    ]
    
    //level 4 bird
    static let level4BirdMon = [
        megaPidgeot,
        lugia
    ]
    
    //level 1 insect
    static let level1InsectMon = [
        caterpie,
        dustox,
        grubbin
    ]
    
    //level 2 insect
    static let level2InsectMon = [
        metapod,
        galvantula
    ]
    
    //level 3 insect
    static let level3InsectMon = [
        butterfree,
        heracross
    ]
    
    //level 4 insect
    static let level4InsectMon = [
        megaScizor
    ]
}
