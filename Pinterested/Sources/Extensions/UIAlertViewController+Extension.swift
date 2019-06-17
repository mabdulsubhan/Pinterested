//
//  UIAlertViewController+Extension.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    /// Method which popups a UIAlertController with a given message
    ///
    /// - Parameter message: message string to be shown
    @discardableResult
    static func showAlert(withMessage  message: String) -> UIAlertController{
        let controller = UIAlertController(title: "Error Message",
                                           message: message,
                                           preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
        return controller
    }
}
