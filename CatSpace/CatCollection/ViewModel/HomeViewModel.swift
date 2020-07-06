//
//  HomeViewModel.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import Reachability
import Combine

// MARK: Protocol

protocol HomeViewModelProtocol: NSObject {
    func dataRefreshed()
    func networkAvailable(_ available: Bool)
}

// MARK: Class

final class HomeViewModel {
    
    // MARK: Properties
    
    weak var delegate: HomeViewModelProtocol? = nil
    private var service = HomeApiService()
    private var subscriber: AnyCancellable? = nil
    
    // MARK: Initialisers
    
    init(withDelegate delegate: HomeViewModelProtocol? = nil) {
        self.delegate = delegate
        addNetworkObservers()
        fetchCatList()
    }
    
    // MARK: Private methods
    
    private func fetchCatList() {
        if ReachabilityHelper.shared.reachability.connection == .unavailable {
            self.delegate?.dataRefreshed()
            return
        }
        CoreDataHelper.clearAllObjectsOf(CatInfo.self, in: CoreDataStack.shared.context)
        let publisher = service.getCatListPublisher()
        self.subscriber = publisher?.sink(receiveCompletion: { completion in
            CoreDataStack.shared.saveChanges()
            self.delegate?.dataRefreshed()
        }, receiveValue: { _ in })
    }
    
    deinit {
        delegate = nil
        subscriber = nil
    }
}

extension HomeViewModel {
    
    func addNetworkObservers() {
        ReachabilityHelper.shared.start()
        ReachabilityHelper.shared.reachability.whenReachable = { _ in
            self.delegate?.networkAvailable(true)
        }
        ReachabilityHelper.shared.reachability.whenUnreachable = { _ in
            self.delegate?.networkAvailable(false)
        }
    }

}
