//
//  User.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let identifier: String
    let username: String
    let name: String
    let profileImages: ProfileImages
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case profileImages = "profile_image"
        case username, name, links
    }
    
    struct ProfileImages: Codable {
        let small: String
        let medium: String
        let large: String
    }
}
