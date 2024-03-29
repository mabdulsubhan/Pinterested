//
//  UIColor+Extensions.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension UIColor {
    static let secondaryColor = UIColor(red: 58/255, green: 31/255, blue: 88/255, alpha: 1)
    static let primaryColor = UIColor.white

    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(white: 0.5, alpha: 1)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
}

