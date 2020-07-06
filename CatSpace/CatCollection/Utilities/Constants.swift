//
//  Constants.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation

struct Identifiers {
    
    struct Segue {
        static let showDetails = "ShowDetailsSegueId"
    }
    
    struct CollectionView {
        static let header = "CollectionViewHeaderId"
        static let infoCell = "CatInfoCollectionViewCellId"
    }
   
    struct ViewController {
        static let detailsView = "DetailsViewControllerID"
    }
    
    struct StoryBoard {
        static let main = "Main"
    }
}

struct Urls {
    static let imageSearch = "https://api.thecatapi.com/v1/images/search?limit=20"
}

struct StringConstants {
    
    struct NavigationTitle {
        static let home = "CatSpace!!!"
        static let details = "Details"
    }
}

struct CoreDataConstants {
    struct Entity {
        static let catInfo = "CatInfo"
    }
    static let modelName = "CatSpace"
}
