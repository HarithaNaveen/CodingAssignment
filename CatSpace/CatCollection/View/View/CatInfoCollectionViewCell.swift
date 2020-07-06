//
//  CatInfoCollectionViewCell.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit
import SDWebImage

final class CatInfoCollectionViewCell: UICollectionViewCell {
    
    
     // MARK: IBOutlets
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var idLabel: UILabel!
    
    //  MARK: public methods
    
    func updateUI(with catInfo: CatInfo) {
        if let imageUrlString = catInfo.imageUrl,
            let imageURL = URL(string: imageUrlString) {
            self.iconImageView.sd_setImage(with: imageURL)
        }
        self.idLabel.text = catInfo.id ?? "Unknown"
    }
    
}
