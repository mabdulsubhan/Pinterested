//
//  CacheManagerTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest
@testable import Cache

class CacheManagerTests: XCTestCase {

    func testCacheName() {
        let name = "Cache"
        CacheManager.shared.name = name
        XCTAssertEqual(name, CacheManager.shared.name)
    }
    
    func testCacheConfiguration() {
        let config = CacheConfiguration(countLimit: 200, totalCostLimit: 300)
        CacheManager.shared.configuration = config
        XCTAssertEqual(CacheManager.shared.countLimit, 200)
        XCTAssertEqual(CacheManager.shared.totalCostLimit, 300)
    }
    
    func testCacheObject() {
        let bundle = Bundle.init(for: CacheManagerTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        CacheManager.shared.setObject(object: image, forKey: "image")
        if let object = CacheManager.shared.getObject(withKey: "image") as UIImage? {
            XCTAssertEqual(object.size, image.size)
        }
    }

    func testCacheObjectWithCost() {
        let bundle = Bundle.init(for: CacheManagerTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        CacheManager.shared.setObject(object: image, forKey: "image", cost: 10)
        if let object = CacheManager.shared.getObject(withKey: "image") as UIImage? {
            XCTAssertEqual(object.size, image.size)
        }
    }

    func testRemoveObject() {
        let bundle = Bundle.init(for: CacheManagerTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        CacheManager.shared.setObject(object: image, forKey: "image")
        CacheManager.shared.removeObject(forKey: "image")
        XCTAssertNil(CacheManager.shared.getObject(withKey: "image") as UIImage?)
    }
    
    func testRemoveAllObject() {
        CacheManager.shared.setObject(object: "aa", forKey: "aa")
        CacheManager.shared.setObject(object: "bb", forKey: "bb")
        CacheManager.shared.setObject(object: "cc", forKey: "cc")
        CacheManager.shared.removeAllObjects()
        XCTAssertNil(CacheManager.shared.getObject(withKey: "aa") as String?)
        XCTAssertNil(CacheManager.shared.getObject(withKey: "bb") as String?)
        XCTAssertNil(CacheManager.shared.getObject(withKey: "cc") as String?)
    }

    func testCacheDelegate() {
        let delegate = self
        CacheManager.shared.delegate = delegate
        XCTAssertNotNil(CacheManager.shared.delegate)
    }

}

extension CacheManagerTests: NSCacheDelegate {
    
}
