//
//  IntCachableTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest

class IntCachableTests: XCTestCase {

    func testIntDataConversion() {
        let number = 100
        let data = number.data
        if let data = data, let numberValue = Int.object(fromData: data) as? Int {
            XCTAssertEqual(numberValue, number)
        }
    }

}
