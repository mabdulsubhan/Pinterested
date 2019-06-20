//
//  CacheConfigurationTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest
@testable import Cache

class CacheConfigurationTests: XCTestCase {

    func testDefaultConfig() {
        let defaultConfig = CacheConfiguration.default()
        XCTAssertEqual(defaultConfig.countLimit, CacheConfigurationConstants.defaultCountLimit)
        XCTAssertEqual(defaultConfig.totalCostLimit, CacheConfigurationConstants.defaultCostLimit)
    }
}
