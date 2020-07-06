//
//  HomeViewController.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit
import CoreData

final class HomeViewController: UIViewController {

    
    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    
    var homeViewModel: HomeViewModel? = nil
    lazy var fetchedResultsController: NSFetchedResultsController<CatInfo> = {
        return getFetchedResultsController()
    }()
    
    // MARK: Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityLoader.shared.show()
        homeViewModel = HomeViewModel(withDelegate: self)
        self.navigationItem.title = StringConstants.NavigationTitle.home
        performFetch()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in self.collectionView.collectionViewLayout.invalidateLayout() },
                            completion: { _ in })
    }
    
    deinit {
        homeViewModel = nil
    }
    
}

private extension HomeViewController {
    
    func performFetch() {
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
    }
}
