//
//  Links.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

struct Links: Codable {
    let primary: String
    let html: String?
    let photos: String?
    let likes: String?
    let download: String?
    
    enum CodingKeys: String, CodingKey {
        case primary = "self"
        case html, photos, likes, download
    }
}
