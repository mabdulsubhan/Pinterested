//
//  PinboardService.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation


typealias PinResponse = (Result<[Pin],NetworkError>) -> Void

/// Pinboard Service  Protocol
protocol PinboardService {
    func fetchPins(withCompletion: @escaping (PinResponse) )
}

/// Pinboard Service  Protocol Implementation
class PinboardServiceImpl: PinboardService {
        
    /// Properties
    let translationLayer: TranslationLayer
    let networkManager: Networking
    
    /// Init
    init(translationLayer: TranslationLayer = JSONTranslation(), networkManager: Networking = NetworkManager() ) {
        self.translationLayer = translationLayer
        self.networkManager = networkManager
    }
    
    /// Method
    func fetchPins(withCompletion: @escaping (PinResponse) ) {
        
        let endPoint = Endpoint(method: .get, route: APIConstants.PinBoardAPIRoute ,parameters:nil)
        
        networkManager.request(endPoint) { [weak self] (result) in
           
            switch result {
            case .success(let data):
                do {
                    guard let self = self else { return }
                    
                    let pinArray: [Pin] = try self.translationLayer.translateToObject(withData: data)
                    withCompletion(.success(pinArray))
                    
                } catch {
                    withCompletion(.failure(NetworkError.decoding(error)))
                    
                }
                
            case .failure(let error):
                withCompletion(.failure(error))
            }
        }
    }
    
}
