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
    case PinDetail
}

class SceneFactory {
    
    private static var sharedSceneFactory = SceneFactory()
    
    class func shared() -> SceneFactory {
        return sharedSceneFactory
    }
    
    func getScene(sceneType: SceneType, withPin pin: Pin? = nil) -> UIViewController {
        switch sceneType {
        case .Pinboard:
            return getPinboardScene()
        case .PinDetail:
            return getPinDetailsScene(withPin: pin)
        }
    }

    /// Builds PinboardViewController and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: PinboardViewController
    private func getPinboardScene() -> PinboardViewController {
        
        let storyboard = UIStoryboard(name: UIStoryboard.Name.Pinboard.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.Pinboard.rawValue) as! PinboardViewController
        
        let dataProvider = PinboardDataProvider()
        dataProvider.pinboardService = PinboardService()
        let coordinator = PinboardCoordinator(view: viewController)
        
        let viewModel = PinboardViewModel(withDataProvider: dataProvider, andCoordinator: coordinator)
        
        dataProvider.delegate = viewModel
        viewModel.dataProvider = dataProvider
        viewController.viewModel = viewModel
        return viewController
    }

    /// Builds PinDetailViewController and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: PinDetailViewController
    private func getPinDetailsScene(withPin pin: Pin?) -> PinDetailViewController {
        
        let storyboard = UIStoryboard(name: UIStoryboard.Name.PinDetail.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.PinDetail.rawValue) as! PinDetailViewController
        let viewModel = PinDetailViewModel(pin)
        viewController.viewModel = viewModel
        
        return viewController
    }
}
