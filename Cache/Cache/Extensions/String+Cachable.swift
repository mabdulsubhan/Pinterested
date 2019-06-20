//
//  String+Cachable.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

extension String: Cachable {
    public var data: Data? {
        return self.data(using: .utf8)
    }
    
    public static func object(fromData data: Data) -> Cachable? {
        return String(decoding: data, as: UTF8.self)
    }
    
    
}
