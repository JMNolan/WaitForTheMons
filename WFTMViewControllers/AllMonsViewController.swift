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
    
    var dataController: DataController!
    var fetchedResultsController: NSFetchedResultsController<Mon>!
    var monCount: Int!
    var blockOperations: [BlockOperation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monCollectionView.delegate = self
        monCollectionView.dataSource = self
        pullMon()
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
            self.monCount = fetchedResultsController.fetchedObjects?.count
        } catch {
            print("error fetching results from fetchedResultsController")
        }
    }
    
    //MARK: Collection View Data Source Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: pass the selected mon and transition to MonDetailViewController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.monCount {
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonCell", for: indexPath) as! MonCell
        let mon = fetchedResultsController.object(at: indexPath)
//        if let monImageData = mon.image {
//            if let monImage = UIImage(data: monImageData) {
//                cell.cellImage.image = monImage
//                cell.mon = mon
//                return cell
//            }
//        }
//        cell.mon = mon
//        cell.setImage(mon: mon)
        cell.setImage(mon: mon)
        return cell
    }
}

extension AllMonsViewController {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        blockOperations.removeAll(keepingCapacity: false)
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        monCollectionView.performBatchUpdates({
            for operation in self.blockOperations {
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
