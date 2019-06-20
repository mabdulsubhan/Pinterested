//
//  UIImageViewCachableTests.swift
//  CacheTests
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest

class UIImageViewCachableTests: XCTestCase {

    func testImageView() {
        let imageView = UIImageView()
        let bundle = Bundle.init(for: UIImageViewCachableTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        if let url = URL(string: "https://images.unsplash.com/photo-1464550883968-cec281c19761?w=100") {
            imageView.downloadImage(url: url, placeholderImage: image)
            XCTAssertNotNil(imageView.image)
        }
    }
}
