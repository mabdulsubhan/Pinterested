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
    var movie: Movie?
    
    init(_ movie: Movie?) {
        
        self.movie = movie
        self.movieTitleText = movie?.title ?? ""
        self.movieDescription = movie?.overview ?? ""
        self.moviePosterUrl = APIConstants.ImageBaseURL + APIConstants.ImagePreviewSize + (movie?.posterPath ?? "")
        
        let date = DateTimeUtility.getReleaseDateFromString(dateString: movie?.releaseDate ?? "")
        self.movieReleaseDate = DateTimeUtility.convertToLongDateFormat(from: date) ?? ""
    }
    
}
