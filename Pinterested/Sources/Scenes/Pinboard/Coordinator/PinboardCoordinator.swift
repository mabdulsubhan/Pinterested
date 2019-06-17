//
//  PinboardCoordinator.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation
import UIKit

/// Pinboard coordinator protocol
protocol PinboardCoordinator {
    func navigateToMovieDetail(withMovie movie: Movie?)
}

/// Protocol implementation of movies list coordinator
class PinboardCoordinatorImpl: PinboardCoordinator {
    weak var view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}

extension PinboardCoordinatorImpl {
    
    func navigateToMovieDetail(withMovie movie: Movie?) {
//        let detailController = SceneFactory.shared().getScene(sceneType: .MovieDetail, withMovie: movie)
//        view?.navigationController?.pushViewController(detailController, animated: true)
    }
}
