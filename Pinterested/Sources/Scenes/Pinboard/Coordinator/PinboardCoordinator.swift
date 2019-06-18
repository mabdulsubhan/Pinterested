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
    func navigateToPinDetail(withPin pin: Pin?)
}

/// Protocol implementation of pinboard coordinator
class PinboardCoordinatorImpl: PinboardCoordinator {
    weak var view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}

extension PinboardCoordinatorImpl {
    
    func navigateToPinDetail(withPin pin: Pin?) {
        //TODO
//        let detailController = SceneFactory.shared().getScene(sceneType: .PinDetail, withPin: pin)
//        view?.navigationController?.pushViewController(detailController, animated: true)
    }
}
