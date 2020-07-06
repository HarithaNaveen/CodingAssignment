//
//  HomeViewController+CollectionView.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit
import CoreData

extension HomeViewController: UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let catInfo = fetchedResultsController.fetchedObjects?[indexPath.row],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.CollectionView.infoCell,
                                                          for: indexPath) as? CatInfoCollectionViewCell else {
                                                            return UICollectionViewCell()
        }
        cell.updateUI(with: catInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: Identifiers.CollectionView.header,
                                                                             for: indexPath)
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 4
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
        return CGSize(width: size, height: (size * 1.4))
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    // MARK: UICollectionViewDelegate methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let catInfo = fetchedResultsController.fetchedObjects?[indexPath.row],
            let detailsViewController = DetailsViewController.instantiate(with: catInfo) else {
                return
        }
        self.show(detailsViewController, sender: self)
    }
    
}
