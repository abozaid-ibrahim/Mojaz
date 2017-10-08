//
//  TestCaching.swift
//  MojazTests
//
//  Created by abuzeid ibarhim on 10/4/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import XCTest
@testable import Mojaz

class TstCaching:XCTestCase {
    
    override func setUp() {
    print("start>>>..............................")
        
    }
    func testFreeStorageExtraCach() {
        CachManager.manager.clearOverWeightStorage()
        XCTAssertLessThan(CachManager.manager.getStorgeCachSize(), UInt64(CachManager.manager.maxStorageToUse))
    }
    
    
    
    
}

