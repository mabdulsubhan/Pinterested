//
//  Int+Cachable.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

extension Int: Cachable {
    public var data: Data? {
        var intData = self
        return Data(bytes: &intData,
                    count: MemoryLayout.size(ofValue: intData))
    }
    
    public static func object(fromData data: Data) -> Cachable? {
        var num: UInt8 = 0
        data.copyBytes(to: &num, count: MemoryLayout<NSInteger>.size)
        return Int(num)
    }
    
    
}
