//
//  HomeViewController+ViewModelProtocol.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import Reachability

extension HomeViewController: HomeViewModelProtocol {
    
    func dataRefreshed() {
        self.collectionView.reloadData()
        ActivityLoader.shared.hide()
    }
    
    func networkAvailable(_ available : Bool) {
        self.view.backgroundColor =  available ? .onlineBG : .offlineBG
    }
}
