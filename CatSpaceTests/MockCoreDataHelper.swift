//
//  MockCoreDataHelper.swift
//  CatSpaceTests
//
//  Created by 909547 on 05/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import CoreData
@testable import CatSpace

class MockCoreDataHelper: CoreDataHelper {
    
    static func getCountOf<T: NSManagedObject>(_ entity: T) -> Int {
        let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        do {
            let count = try MockCoreDataStack.shared.context.count(for: fetchRequest)
            return count
        } catch let error {
            print("Error in fetching objects count entity \(error)")
            return 0
        }
    }
    
    static func testInsertSampleJSON(with decoder: JSONDecoder) {
        // Given
        if let path = Bundle.main.path(forResource: "SampleResponse", ofType: "json") {
            do {
                guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)   else {
                    return
                }
                _ = try decoder.decode([CatInfo].self, from: jsonData)
                MockCoreDataStack.shared.saveChanges()
            } catch {
                print("Tests: Error in decoding sample response")
            }
        }
    }
}
