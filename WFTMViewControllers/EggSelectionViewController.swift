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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //set collection view delegates
        tierOneEggCollectionView.delegate = self
        tierTwoEggCollectionView.delegate = self
        tierThreeEggCollectionView.delegate = self
        tierFourEggCollectionView.delegate = self
        
        //set collection views' data sources
        tierOneEggCollectionView.dataSource = self
        tierTwoEggCollectionView.dataSource = self
        tierThreeEggCollectionView.dataSource = self
        tierFourEggCollectionView.dataSource = self
        
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
    }
    
    @objc func reloadAllCollections() {
        tierOneEggCollectionView.reloadData()
        tierTwoEggCollectionView.reloadData()
        tierThreeEggCollectionView.reloadData()
        tierFourEggCollectionView.reloadData()
    }
    
    func loadEggDetailView(currentEgg: WFTMModel.Egg) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "EggDetailViewController") as! EggDetailViewController
        newVC.currentEgg = currentEgg
        newVC.dataController = self.dataController
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func mainMenuButtonPressed(_ sender: Any) {
        let mainMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        mainMenuVC.dataController = self.dataController
        self.present(mainMenuVC, animated: true, completion: nil)
    }
    
    @IBAction func monsButtonPressed(_ sender: Any) {
        let allMonsVC = self.storyboard?.instantiateViewController(withIdentifier: "AllMonsViewController") as! AllMonsViewController
        allMonsVC.dataController = self.dataController
        self.present(allMonsVC, animated: true, completion: nil)
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
            if collectionView == self.tierTwoEggCollectionView {
                return tierTwoEggSource.count
            } else {
                if collectionView == self.tierThreeEggCollectionView {
                    return tierThreeEggSource.count
                } else {
                    return tierFourEggSource.count
                }
            }
        }
    }

    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("CellForItemAt fired")
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
            if collectionView == self.tierTwoEggCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierTwoEggCell", for: indexPath) as! EggCell
                cell.cellImage.image = tierTwoEggSource[indexPath.row].image
                cell.eggForCell = tierTwoEggSource[indexPath.row]
                return cell
            } else {
                if collectionView == self.tierThreeEggCollectionView {
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
            let egg = self.tierOneEggSource[indexPath.row]
            loadEggDetailView(currentEgg: egg)
        } else {
            if collectionView == self.tierTwoEggCollectionView {
                let egg = self.tierTwoEggSource[indexPath.row]
                loadEggDetailView(currentEgg: egg)
            } else {
                if collectionView == self.tierThreeEggCollectionView {
                    let egg = self.tierThreeEggSource[indexPath.row]
                    loadEggDetailView(currentEgg: egg)
                } else {
                    let egg = self.tierFourEggSource[indexPath.row]
                    loadEggDetailView(currentEgg: egg)
                }
            }
        }
    }
}
