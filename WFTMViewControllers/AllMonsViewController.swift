//
//  AllMonsViewController.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/15/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AllMonsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var monCollectionView: UICollectionView!
    @IBOutlet weak var noMonsLabel: UILabel!
    
    
    var dataController: DataController!
    var fetchedResultsController: NSFetchedResultsController<Mon>!
    var monCount: Int!
    var blockOperations: [BlockOperation] = []
    var selectedMon: Mon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monCollectionView.delegate = self
        monCollectionView.dataSource = self
        pullMon()
        
        //set background from user defaults
        if let background = UserDefaults.standard.object(forKey: WFTMModel.userDefaultStrings.backgroundImageName) {
            let backgroundName = background as! String
            view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
        }
    }
    
    //MARK: Functions
    func pullMon() {
        let fetchRequest: NSFetchRequest<Mon> = Mon.fetchRequest()
        let sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        fetchRequest.sortDescriptors = sortDescriptors
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
            monCount = fetchedResultsController.fetchedObjects?.count
            if monCount > 0 {
                noMonsLabel.isHidden = true
            } else {
                noMonsLabel.isHidden = false
            }
        } catch {
            print("error fetching results from fetchedResultsController")
        }
    }
    
    @IBAction func eggsButtonPressed(_ sender: Any) {
        print("EGGS pressed")
        if WFTMModel.eggSelectionInstantiated {
            WFTMModel.allMonsInstantiated = false
            performSegue(withIdentifier: "UnwindToEggSelection", sender: self)
        } else {
            WFTMModel.allMonsInstantiated = true
            performSegue(withIdentifier: "ToEggSelection", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainMenuVC = segue.destination as? MainMenuViewController {
            mainMenuVC.dataController = dataController
            WFTMModel.allMonsInstantiated = false
            WFTMModel.eggSelectionInstantiated = false
        }
        
        if let monDetailVC = segue.destination as? MonDetailViewController {
            monDetailVC.dataController = dataController
            monDetailVC.currentMon = selectedMon
        }
        
        if let eggSelectionVC = segue.destination as? EggSelectionViewController {
            eggSelectionVC.dataController = dataController
        }
    }
    
    @IBAction func unwindToAllMons(_ sender: UIStoryboardSegue) {
    }
    
    //MARK: Collection View Data Source Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMon = fetchedResultsController.object(at: indexPath)
        WFTMModel.allMonsInstantiated = true
        performSegue(withIdentifier: "ToMonDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = monCount {
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonCell", for: indexPath) as! MonCell
        let mon = fetchedResultsController.object(at: indexPath)
        cell.setImage(mon: mon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageWidth = view.bounds.width/5.0
        let imageHeight = imageWidth
        
        return CGSize(width: imageWidth, height: imageHeight)
    }
}

extension AllMonsViewController {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        blockOperations.removeAll(keepingCapacity: false)
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        monCollectionView.performBatchUpdates({
            for operation in blockOperations {
                operation.start()
            }
        }, completion: {(completed) in
            
        })
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            blockOperations.append(BlockOperation(block: {
                self.monCollectionView.insertItems(at: [newIndexPath!])
            }))
        case .delete:
            blockOperations.append(BlockOperation(block: {
                self.monCollectionView.deleteItems(at: [indexPath!])
            }))
        default:
            break
        }
    }
}
