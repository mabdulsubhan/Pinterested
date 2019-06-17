//
//  SceneFactory.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

enum SceneType {
    case Pinboard
}

class SceneFactory {
    
    private static var sharedSceneFactory = SceneFactory()
    
    class func shared() -> SceneFactory {
        return sharedSceneFactory
    }
    
    func getScene(sceneType: SceneType, withPin pin: Movie? = nil) -> UIViewController {
        switch sceneType {
        case .Pinboard:
            return getPinboardScene()
//        case .MovieDetail:
//            return getMovieDetailsScene(withMovie: movie)
        }
    }

    /// Builds PinboardViewController and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: PinboardViewController
    private func getPinboardScene() -> PinboardViewController {
        
        let storyboard = UIStoryboard(name: UIStoryboard.Name.Pinboard.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.Pinboard.rawValue) as! PinboardViewController
        
        let dataProvider = PinboardDataProviderImpl()
        dataProvider.pinboardService = PinboardServiceImpl()
        let coordinator = PinboardCoordinatorImpl(view: viewController)
        
        let viewModel = PinboardViewModel(withDataProvider: dataProvider, andCoordinator: coordinator)
        
        dataProvider.delegate = viewModel
        viewModel.dataProvider = dataProvider
        viewController.viewModel = viewModel
        return viewController
    }

    /// Builds MovieDetailViewController and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: MovieDetailViewController
    /*
    private func getMovieDetailsScene(withMovie movie: Movie?) -> MovieDetailViewController {
        
        let storyboard = UIStoryboard(name: UIStoryboard.Name.moviesDetails.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.moviesDetails.rawValue) as! MovieDetailViewController
        let viewModel = MovieDetailViewModel(movie)
        viewController.viewModel = viewModel
        
        return viewController
    }
     */
}
