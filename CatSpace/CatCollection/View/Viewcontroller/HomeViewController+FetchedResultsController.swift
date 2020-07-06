//
//  HomeViewController+FetchedResultsController.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import CoreData

extension HomeViewController {
    
    func getFetchedResultsController() -> NSFetchedResultsController<CatInfo> {
        let fetchRequest: NSFetchRequest<CatInfo> = CatInfo.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id",
                                                         ascending: true,
                                                         selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: CoreDataStack.shared.context,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }
    
}

extension HomeViewController: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.collectionView.reloadData()
    }
    
}
