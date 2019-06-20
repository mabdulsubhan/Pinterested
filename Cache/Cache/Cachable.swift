//
//  Cachable.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 20/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

public protocol Cachable {
    var data: Data? { get }
    static func object(fromData data: Data) -> Cachable?
}
