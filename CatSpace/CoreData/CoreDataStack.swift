//
//  CoreDataStack.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import CoreData

final class CoreDataStack {
    
    // MARK: Properties
    
    static let shared = CoreDataStack()
    private let modelName = CoreDataConstants.modelName
    
   public private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error in loading persistent store \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    public private(set) lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    // MARK: Initialisers
    
    private init() { }
    
    // MARK: Public Methods
    
    public func saveChanges() {
        context.performAndWait({
            do {
                if self.context.hasChanges {
                    try self.context.save()
                }
            } catch {
                let saveError = error as NSError
                print("Unable to Save Changes \(saveError), \(saveError.localizedDescription)")
            }
        })
    }

}
