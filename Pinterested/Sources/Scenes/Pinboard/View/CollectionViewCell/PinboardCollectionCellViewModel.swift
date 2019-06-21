//
//  PinboardCollectionCellViewModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

/// PinboardViewModel
struct PinboardCollectionCellViewModel {
    
     /// Properties
    var pin: Pin
    var thumbImageURL: URL?
    var imageWidth: Int
    var imageHeight: Int
    var username: String
    var time: String
    var color: UIColor
    var pinIdentifier: String
    
    init(_ pin: Pin) {
        
        self.pin = pin
        self.imageWidth = pin.width
        self.imageHeight = pin.height
        self.thumbImageURL = URL(string: pin.urls.raw + "?w=1200")
        self.username = "@" + pin.user.username
        self.time = pin.creationDate.getElapsedInterval()
        self.color = pin.color
        self.pinIdentifier = pin.identifier
    }
    
}
