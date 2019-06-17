//
//  UpcomingMoviesModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

struct UpcomingMovies : Codable {
    
    let results : [Movie]?
    let page : Int
    let totalResults : Int
    let totalPages : Int
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
