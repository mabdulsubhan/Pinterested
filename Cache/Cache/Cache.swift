//
//  Cache.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

private class ObjectWrapper {
    let value: Any
    
    init(_ value: Any) {
        self.value = value
    }
}

private class KeyWrapper<KeyType: Hashable>: NSObject {
    let key: KeyType
    init(_ key: KeyType) {
        self.key = key
    }
    
    override var hash: Int {
        return key.hashValue
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? KeyWrapper<KeyType> else {
            return false
        }
        return key == other.key
    }
}

class Cache<KeyType: Hashable, ObjectType> {
    
    private let cache: NSCache<KeyWrapper<KeyType>, ObjectWrapper> = NSCache()
    
    public init(lowMemoryAware: Bool = true) {
        guard lowMemoryAware else { return }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onLowMemory),
            name: UIApplication.didReceiveMemoryWarningNotification,
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func onLowMemory() {
        removeAllObjects()
    }
    
    open var name: String {
        get { return cache.name }
        set { cache.name = newValue }
    }
    
    weak open var delegate: NSCacheDelegate? {
        get { return cache.delegate }
        set { cache.delegate = newValue }
    }
    
    open func object(forKey key: KeyType) -> ObjectType? {
        return cache.object(forKey: KeyWrapper(key))?.value as? ObjectType
    }
    
    open func setObject(_ obj: ObjectType, forKey key: KeyType) { // 0 cost
        return cache.setObject(ObjectWrapper(obj), forKey: KeyWrapper(key))
    }
    
    open func setObject(_ obj: ObjectType, forKey key: KeyType, cost: Int) {
        return cache.setObject(ObjectWrapper(obj), forKey: KeyWrapper(key), cost: cost)
    }
    
    open func removeObject(forKey key: KeyType) {
        return cache.removeObject(forKey: KeyWrapper(key))
    }
    
    open func removeAllObjects() {
        return cache.removeAllObjects()
    }
    
    open var totalCostLimit: Int {
        get { return cache.totalCostLimit }
        set { cache.totalCostLimit = newValue }
    }
    
    open var countLimit: Int {
        get { return cache.countLimit }
        set { cache.countLimit = newValue }
    }
}
