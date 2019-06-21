//
//  PinterestedUITests.swift
//  PinterestedUITests
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import XCTest

class PinterestedUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    // MARK: - Tests
    func testImageCellFlow() {
        app.launch()
        app.cells["4kQA1aQK8-Y"].tap()
        let flag = app.images["PinDetailImageView"].waitForExistence(timeout: 5)
        if flag {
            XCTAssertTrue(app.isDisplayingImageCell)
        }
    }
}

extension XCUIApplication {
    var isDisplayingImageCell: Bool {
        return images["PinDetailImageView"].exists
        //return otherElements["PinDetailImageView"].exists
    }
}
