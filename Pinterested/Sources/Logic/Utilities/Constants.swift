//
//  Constant.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

/// API Constants
struct APIConstants {
    static let PinBoardAPIRoute = "raw/wgkJgazE"
    
}

/// Base Path (Environment)
public enum BasePath: String {
    case development = "http://pastebin.com/"
    case test = "http://someurl.com"
}
