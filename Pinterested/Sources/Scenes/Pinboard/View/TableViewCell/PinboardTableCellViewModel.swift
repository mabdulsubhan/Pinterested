//
//  PinboardTableCellViewModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

/// PinboardViewModel

struct PinboardTableCellViewModel {
    
     /// Properties
    var pin: Pin
    var thumbImageURL: URL?
    var imageWidth: Int
    var imageHeight: Int
    
    init(_ pin: Pin) {
        
        //TODO
        self.pin = pin
        self.imageWidth = pin.width
        self.imageHeight = pin.height
        self.thumbImageURL = URL(string: pin.urls.raw + "?w=600")//APIConstants.ImageBaseURL + APIConstants.ImagePreviewSize + (pin?.identifier ?? "")
        
//        let date = DateTimeUtility.getReleaseDateFromString(dateString: pin?.identifier ?? "")
//        self.movieReleaseDate = DateTimeUtility.convertToLongDateFormat(from: date) ?? ""
    }
    
}
