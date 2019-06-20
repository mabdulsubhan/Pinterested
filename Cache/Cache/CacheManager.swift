//
//  CacheManager.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 19/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

open class CacheManager {
    public static let shared = CacheManager(withConfiguration: CacheConfiguration.default())
    
    private let cache = Cache<String, Data>()
    
    init(withConfiguration config: CacheConfigurationProtocol) {
        configuration = config
    }
    
    public var configuration: CacheConfigurationProtocol {
        didSet {
            totalCostLimit = configuration.totalCostLimit
            countLimit = configuration.countLimit
        }
    }

    public var name: String {
        get { return cache.name }
        set { cache.name = newValue }
    }
    
    weak public var delegate: NSCacheDelegate? {
        get { return cache.delegate }
        set { cache.delegate = newValue }
    }

    public func setObject<T>(object: T, forKey key: String) where T: Cachable {
        if let data = object.data {
            cache.setObject(data, forKey: key)
        }
    }

    public func getObject<T>(withKey key: String) -> T? where T: Cachable {
        if let data = cache.object(forKey: key) {
            return T.object(fromData: data) as? T
        }
        return nil
    }
    
    public func setObject<T>(object: T, forKey key: String, cost: Int) where T: Cachable {
        if let data = object.data {
            cache.setObject(data, forKey: key, cost: cost)
        }
    }
    
    public func removeObject(forKey key: String) {
        return cache.removeObject(forKey: key)
    }
    
    public func removeAllObjects() {
        return cache.removeAllObjects()
    }
    
    public var totalCostLimit: Int {
        get { return cache.totalCostLimit }
        set { cache.totalCostLimit = newValue }
    }

    public var countLimit: Int {
        get { return cache.countLimit }
        set { cache.countLimit = newValue }
    }
}
