//
//  CoreDataStackTests.swift
//  CatSpaceTests
//
//  Created by 909547 on 05/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import XCTest
import CoreData
@testable import CatSpace

class CoreDataStackTests: XCTestCase {
    
    var decoder: JSONDecoder!
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context] = MockCoreDataStack.shared.context
    }
    
    func testObjectCount() {
        MockCoreDataHelper.testInsertSampleJSON(with: decoder)
        XCTAssertTrue(MockCoreDataHelper.getAllCatsInfoCount() == 100, "All data inserted successfully")
        MockCoreDataHelper.clearAllObjectsOf(CatInfo.self,
                                             in: MockCoreDataStack.shared.context)
        XCTAssertTrue(MockCoreDataHelper.getAllCatsInfoCount() == 0, "Data deleted properly")
    }

}
