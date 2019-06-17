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
    
    func onSuccess(_ upcomingMovies: UpcomingMovies)
    func onFailure(_ error: NetworkError)
    func showLoader(show: Bool)
}


/// PinboardDataProvider Protocol
protocol PinboardDataProvider {

    func providePaginatedUpcomingMovies()
    var delegate: PinboardDataProviderDelegate? { get set }
}

/// PinboardDataProvider Protocol Implementation
class PinboardDataProviderImpl: PinboardDataProvider {
    
    /// Injected Properties
    var pinboardService: PinboardService!
    
    /// Private Properties
    private var pageCount = 1
    private var totalPages: Int = 1
    private var isFetching = false
    
    /// Computed Properties
    weak var delegate: PinboardDataProviderDelegate?
    
    /// Methods
    func providePaginatedUpcomingMovies() {
        
        if pageCount <= totalPages && isFetching == false {

            isFetching = true
            delegate?.showLoader(show: isFetching)
            pinboardService.fetchMovies(forPage: pageCount) { [weak self] (result) in
                
                guard let self = self else { return }
        
                self.isFetching = false
                self.delegate?.showLoader(show: self.isFetching)
                
                switch result {
                    
                case .success(let upcomingMovies):
                    self.pageCount = upcomingMovies.page + 1
                    self.totalPages = upcomingMovies.totalPages 
                    self.delegate?.onSuccess(upcomingMovies)
                    
                case .failure(let error):
                    self.delegate?.onFailure(error)

                }
            }
        }
    }
    
}
