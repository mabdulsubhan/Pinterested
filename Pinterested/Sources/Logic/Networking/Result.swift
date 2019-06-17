//
//  Result.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

 /// Result
public enum Result<V, E: Error> {
    case success(V)
    case failure(E)
}
