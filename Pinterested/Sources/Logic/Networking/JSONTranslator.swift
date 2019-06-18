//
//  JSONTranslator.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

/// TranslationLayer Protocol
protocol TranslationLayer {
    func translateToObject<T: Decodable>(withData data: Data) throws -> T
}

/// TranslationLayer Protocol Implmentation
class JSONTranslation: TranslationLayer {
    
    func translateToObject<T: Decodable>(withData data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
