//
//  ReachabilityHelper.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import Reachability

final class ReachabilityHelper {
    
    // MARK: Properties
    
    static let shared = ReachabilityHelper()
    var reachability: Reachability!
    
    // MARK: Initialisers
    
    private init() {}
    
    // MARK: Methods
    
    func start() {
        do {
            reachability = try Reachability()
            try reachability.startNotifier()
        } catch {
            print("Error in tracking network connection")
        }
  
    }
    
    func stop() {
        reachability.stopNotifier()
        reachability = nil
    }
    
    deinit {
         stop()
    }
}
