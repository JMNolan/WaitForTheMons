//
//  EggSelectionViewController.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/15/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EggSelectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Mark: IBOutlets
    @IBOutlet weak var tierOneEggCollectionView: UICollectionView!
    @IBOutlet weak var tierTwoEggCollectionView: UICollectionView!
    @IBOutlet weak var tierThreeEggCollectionView: UICollectionView!
    @IBOutlet weak var tierFourEggCollectionView: UICollectionView!
    @IBOutlet weak var pageName: UILabel!
    
    // Mark: Properties
    var tierOneEggSource = [WFTMModel.Egg]()
    var tierTwoEggSource = [WFTMModel.Egg]()
    var tierThreeEggSource = [WFTMModel.Egg]()
    var tierFourEggSource = [WFTMModel.Egg]()
    var dataController: DataController!
    var selectedEgg: WFTMModel.Egg!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //set delegate and data source for all four collection views
        setDelegateAndDataSource(collectionView: tierOneEggCollectionView)
        setDelegateAndDataSource(collectionView: tierTwoEggCollectionView)
        setDelegateAndDataSource(collectionView: tierThreeEggCollectionView)
        setDelegateAndDataSource(collectionView: tierFourEggCollectionView)
        
        //populate collection view datasources
        tierOneEggSource = WFTMModel.levelOneEggs
        tierTwoEggSource = WFTMModel.levelTwoEggs
        tierThreeEggSource = WFTMModel.levelThreeEggs
        tierFourEggSource = WFTMModel.levelFourEggs
        
        //subscribe to orientation change notifications
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAllCollections), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAllCollections), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadAllCollections()
        
        //set background from user defaults
        if let background = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.backgroundImageName) {
            let backgroundName = background as! String
            view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        }
    }
    
    @objc func reloadAllCollections() {
        tierOneEggCollectionView.reloadData()
        tierTwoEggCollectionView.reloadData()
        tierThreeEggCollectionView.reloadData()
        tierFourEggCollectionView.reloadData()
    }
    
    @IBAction func monsButtonPressed(_ sender: Any) {
        if WFTMModel.allMonsInstantiated {
            WFTMModel.eggSelectionInstantiated = false
            performSegue(withIdentifier: "UnwindToAllMons", sender: self)
        } else {
            WFTMModel.eggSelectionInstantiated = true
            performSegue(withIdentifier: "ToAllMons", sender: self)
        }
    }
//    @IBAction func monsButtonPressed(_ sender: Any) {
//        print("MONS pressed")
//        if WFTMModel.allMonsInstantiated {
//            WFTMModel.eggSelectionInstantiated = false
//            performSegue(withIdentifier: "UnwindToAllMons", sender: self)
//        } else {
//            WFTMModel.eggSelectionInstantiated = true
//            performSegue(withIdentifier: "ToAllMons", sender: self)
//        }
//    }
    
    @IBAction func unwindToEggSelection(_ sender: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainMenuVC = segue.destination as? MainMenuViewController {
            mainMenuVC.dataController = dataController
            WFTMModel.eggSelectionInstantiated = false
            WFTMModel.allMonsInstantiated = false
        }
        
        if let allMonsVC = segue.destination as? AllMonsViewController {
            allMonsVC.dataController = dataController
        }
        
        if let eggDetailVC = segue.destination as? EggDetailViewController {
            eggDetailVC.dataController = dataController
            eggDetailVC.currentEgg = selectedEgg
        }
    }
    
    //called in viewDidLoad to set the delegatea and datasource of each collection view
    func setDelegateAndDataSource(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //collection view layout settings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = height*0.75
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: Data Source Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tierOneEggCollectionView {
            return tierOneEggSource.count
        } else {
            if collectionView == tierTwoEggCollectionView {
                return tierTwoEggSource.count
            } else {
                if collectionView == tierThreeEggCollectionView {
                    return tierThreeEggSource.count
                } else {
                    return tierFourEggSource.count
                }
            }
        }
    }

    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tierOneEggCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierOneEggCell", for: indexPath) as! EggCell
            cell.cellImage.image = tierOneEggSource[indexPath.row].image
            let height = cell.frame.size.height
            let width = height * 0.75
            cell.cellImage.frame.size.height = height
            cell.cellImage.frame.size.width = width
            cell.eggForCell = tierOneEggSource[indexPath.row]
            return cell
        } else {
            if collectionView == tierTwoEggCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierTwoEggCell", for: indexPath) as! EggCell
                cell.cellImage.image = tierTwoEggSource[indexPath.row].image
                cell.eggForCell = tierTwoEggSource[indexPath.row]
                return cell
            } else {
                if collectionView == tierThreeEggCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierThreeEggCell", for: indexPath) as! EggCell
                    cell.cellImage.image = tierThreeEggSource[indexPath.row].image
                    cell.eggForCell = tierThreeEggSource[indexPath.row]
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierFourEggCell", for: indexPath) as! EggCell
                    cell.cellImage.image = tierFourEggSource[indexPath.row].image
                    cell.eggForCell = tierFourEggSource[indexPath.row]
                    return cell
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tierOneEggCollectionView {
            selectedEgg = tierOneEggSource[indexPath.row]
            performSegue(withIdentifier: "ToEggDetail", sender: self)
        } else {
            if collectionView == tierTwoEggCollectionView {
                selectedEgg = tierTwoEggSource[indexPath.row]
                performSegue(withIdentifier: "ToEggDetail", sender: self)
            } else {
                if collectionView == tierThreeEggCollectionView {
                    selectedEgg = tierThreeEggSource[indexPath.row]
                    performSegue(withIdentifier: "ToEggDetail", sender: self)
                } else {
                    selectedEgg = tierFourEggSource[indexPath.row]
                    performSegue(withIdentifier: "ToEggDetail", sender: self)
                }
            }
        }
    }
}
