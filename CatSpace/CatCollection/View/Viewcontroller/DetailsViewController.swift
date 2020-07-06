//
//  DetailsViewController.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var widthLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    // MARK: Properties
    
    private var catInfo: CatInfo!

    // MARK: Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    static public func instantiate(with catInfo: CatInfo) -> DetailsViewController? {
        let storyboard = UIStoryboard(name: Identifiers.StoryBoard.main, bundle: .main)
        guard let viewController = storyboard.instantiateViewController(identifier: Identifiers.ViewController.detailsView) as? DetailsViewController else {
            return nil
        }
        viewController.catInfo = catInfo
        return viewController
    }
    
}

extension DetailsViewController {
    
    private func setupUI() {
        self.navigationItem.title = StringConstants.NavigationTitle.details
        self.idLabel.text = catInfo.id ?? ""
        self.heightLabel.text = "\(catInfo.height)"
        self.widthLabel.text = "\(catInfo.width)"
        if let imageUrlString = catInfo.imageUrl,
            let imageURL = URL(string: imageUrlString) {
            self.iconImageView.sd_setImage(with: imageURL) { (image, _, _, _) in
                self.iconImageView.image = image
            }
        }
    }
    
}
