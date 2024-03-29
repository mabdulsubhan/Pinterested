//
//  PinboardDataProvider.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

/// Delegates Protocol
protocol PinboardDataProviderDelegate: class {
    func onSuccess(_ pinArray: [Pin])
    func onFailure(_ error: NetworkError)
}


/// PinboardDataProvider Protocol
protocol PinboardDataProviderProtocol {

    func providePins()
    var delegate: PinboardDataProviderDelegate? { get set }
}

/// PinboardDataProvider Protocol Implementation
class PinboardDataProvider: PinboardDataProviderProtocol {
    
    /// Injected Properties
    var pinboardService: PinboardService!
    
    /// Private Properties
    private var isFetching = false
    
    /// Computed Properties
    weak var delegate: PinboardDataProviderDelegate?
    
    /// Methods
    func providePins() {
        
        if isFetching == false {

            isFetching = true
            pinboardService.fetchPins() { [weak self] (result) in
                
                guard let self = self else { return }
        
                self.isFetching = false
                
                switch result {
                    
                case .success(let pinArray):
                    self.delegate?.onSuccess(pinArray)
                    
                case .failure(let error):
                    self.delegate?.onFailure(error)

                }
            }
        }
    }
    
}
