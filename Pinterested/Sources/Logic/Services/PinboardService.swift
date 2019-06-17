//
//  PinboardService.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation


typealias UpcomingMovieResponse = (Result<UpcomingMovies,NetworkError>) -> Void

/// Pinboard Service  Protocol
protocol PinboardService {
    func fetchMovies(forPage page: Int, withCompletion: @escaping (UpcomingMovieResponse) )
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
    func fetchMovies(forPage page: Int, withCompletion: @escaping (UpcomingMovieResponse) ) {
        
        let endPoint = Endpoint(method: .get, route: APIConstants.MovieListAPIRoute ,parameters:["api_key": Keys.APIKey,"language": "en-US","page": "\(page)"])
        
        networkManager.request(endPoint) { [weak self] (result) in
           
            switch result {
            case .success(let data):
                do {
                    guard let self = self else { return }
                    
                    let upcomingMovies: UpcomingMovies = try self.translationLayer.translateToObject(withData: data)
                    withCompletion(.success(upcomingMovies))
                    
                } catch {
                    withCompletion(.failure(NetworkError.decoding(error)))
                    
                }
                
            case .failure(let error):
                withCompletion(.failure(error))
            }
        }
    }
    
}
