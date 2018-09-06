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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadAllCollections()
    }
    
    func reloadAllCollections() {
        tierOneEggCollectionView.reloadData()
        tierTwoEggCollectionView.reloadData()
        tierThreeEggCollectionView.reloadData()
        tierFourEggCollectionView.reloadData()
    }
    
    func loadEggDetailView(currentEgg: WFTMModel.Egg) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "EggDetailViewController") as! EggDetailViewController
        newVC.currentEgg = currentEgg
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    //collection view layout settings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 90
        let height = 120
        
        return CGSize(width: width, height: height)
    }
    
    //Data Source Methods for collection views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tierOneEggCollectionView {
            print("The number of eggs is: \(tierOneEggSource.count)")
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
        if collectionView == tierOneEggCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierOneEggCell", for: indexPath) as! EggCell
            cell.cellImage.image = tierOneEggSource[indexPath.row].image
            cell.eggForCell = tierOneEggSource[indexPath.row]
            print("Tier one image is: \(tierOneEggSource[indexPath.row].image)")
            return cell
        } else {
            if collectionView == self.tierTwoEggCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierTwoEggCell", for: indexPath) as! EggCell
                cell.cellImage.image = tierTwoEggSource[indexPath.row].image
                cell.eggForCell = tierTwoEggSource[indexPath.row]
                print("Tier two image is: \(tierTwoEggSource[indexPath.row].image)")
                return cell
            } else {
                if collectionView == self.tierThreeEggCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierThreeEggCell", for: indexPath) as! EggCell
                    cell.cellImage.image = tierThreeEggSource[indexPath.row].image
                    cell.eggForCell = tierThreeEggSource[indexPath.row]
                    print("Tier three image is: \(tierThreeEggSource[indexPath.row].image)")
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierFourEggCell", for: indexPath) as! EggCell
                    cell.cellImage.image = tierFourEggSource[indexPath.row].image
                    cell.eggForCell = tierFourEggSource[indexPath.row]
                    print("Tier four image is: \(tierFourEggSource[indexPath.row].image)")
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
