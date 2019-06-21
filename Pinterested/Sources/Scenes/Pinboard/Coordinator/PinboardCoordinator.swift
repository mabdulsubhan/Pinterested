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
protocol PinboardCoordinatorProtocol {
    func navigateToPinDetail(withPin pin: Pin?)
}

/// Protocol implementation of pinboard coordinator
class PinboardCoordinator: PinboardCoordinatorProtocol {
    weak var view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}

extension PinboardCoordinator {
    
    func navigateToPinDetail(withPin pin: Pin?) {
        let detailController = SceneFactory.shared().getScene(sceneType: .PinDetail, withPin: pin)
        view?.present(detailController, animated: true)
    }
}
