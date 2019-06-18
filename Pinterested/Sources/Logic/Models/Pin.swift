//
//  Pin.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

struct Pin: Codable {
    
    let identifier: String
    let creationDate: Date
    let width: Int
    let height: Int
    let color: String
    let likes: Int
    let isLikedByUser: Bool
    let user: User
    let urls: URLS
    let categories: [Categories]
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case creationDate = "created_at"
        case isLikedByUser = "liked_by_user"
        case width, height, color, likes, user, urls, categories, links
    }
    
    struct URLS: Codable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }

    struct Categories: Codable {
        let identifier: Int
        let title: String
        let countOfPhotos: Int
        let links: Links
        
        enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case countOfPhotos = "photo_count"
            case title, links
        }
    }
}
