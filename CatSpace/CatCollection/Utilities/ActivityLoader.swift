//
//  ActivityLoader.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit

final class ActivityLoader {
    
    // MARK: Properties
    
    static let shared = ActivityLoader()
    private var contentView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
    // MARK: Initialisers
    
    private init() {}
    
    // MARK: Methods
    
    func show() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        contentView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        contentView.center = CGPoint(x: window.frame.width / 2.0,
                                     y: window.frame.height / 2.0)
        contentView.backgroundColor = .lightGray
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: contentView.bounds.width / 2,
                                           y: contentView.bounds.height / 2)
        contentView.addSubview(activityIndicator)
        window.addSubview(contentView)
        activityIndicator.startAnimating()
    }
    
    func hide() {
        activityIndicator.stopAnimating()
        contentView.removeFromSuperview()
    }
}
