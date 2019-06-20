//
//  CacheConfiguration.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

public protocol CacheConfigurationProtocol {
    var countLimit: Int { get set }
    var totalCostLimit: Int { get set }
}

public struct CacheConfiguration: CacheConfigurationProtocol {
    public var countLimit: Int = CacheConfigurationConstants.defaultCountLimit
    public var totalCostLimit: Int = CacheConfigurationConstants.defaultCostLimit
}

extension CacheConfigurationProtocol {
    public static func `default`() -> CacheConfigurationProtocol {
        return CacheConfiguration()
    }
}
