//
//  UIImage+Cachable.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension UIImage: Cachable {
    public var data: Data? {
        return self.pngData()
    }
    
    public static func object(fromData data: Data) -> Cachable? {
        return UIImage(data: data)
    }
}
