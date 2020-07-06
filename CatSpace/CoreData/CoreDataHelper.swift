//
//  CoreDataHelper.swift
//  CatSpace
//
//  Created by 909547 on 04/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    static func clearAllObjectsOf<T: NSManagedObject>(_ entity: T.Type, in context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
        } catch let error {
            print("Error in deleting entity \(error)")
        }
    }
    
}
