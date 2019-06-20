//
//  StringCachableTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest

class StringCachableTests: XCTestCase {

    func testStringDataConversion() {
        let string = "Cache"
        let data = string.data
        if let data = data, let stringValue = String.object(fromData: data) as? String {
            XCTAssertEqual(stringValue, string)
        }
    }
}
