//
//  CatInfo+CoreDataProperties.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//
//

import Foundation
import CoreData

extension CatInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatInfo> {
        return NSFetchRequest<CatInfo>(entityName: CoreDataConstants.Entity.catInfo)
    }

    @NSManaged public var id: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var height: Double
    @NSManaged public var width: Double

}
