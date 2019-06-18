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
    var movieTitleText: String
    var movieDescription: String
    var moviePosterUrl: String
    var movieReleaseDate: String
    var pin: Pin?
    
    init(_ pin: Pin?) {
        
        //TODO
        self.pin = pin
        self.movieTitleText = pin?.identifier ?? ""
        self.movieDescription = pin?.identifier ?? ""
        self.moviePosterUrl = ""//APIConstants.ImageBaseURL + APIConstants.ImagePreviewSize + (pin?.identifier ?? "")
        
        let date = DateTimeUtility.getReleaseDateFromString(dateString: pin?.identifier ?? "")
        self.movieReleaseDate = DateTimeUtility.convertToLongDateFormat(from: date) ?? ""
    }
    
}
