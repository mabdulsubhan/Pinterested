//
//  ImageCachableTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest

class ImageCachableTests: XCTestCase {

    func testImageDataConversion() {
        let bundle = Bundle.init(for: ImageCachableTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        let data = image.data
        if let data = data, let imageValue = UIImage.object(fromData: data) as? UIImage {
            XCTAssertEqual(imageValue.size, image.size)
        }
    }

}
