//
//  UIView+Extensions.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension UIView {

    private func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        gradient.locations = [0.4, 1]
        gradient.compositingFilter = "multiplyBlendMode"
        layer.addSublayer(gradient)
    }
    
    /// Adds a gradient layer on top and bottom of the view
    func addBorderGradients() {
//        addBlackGradientLayerInForeground(frame: bounds, colors: [.clear, UIColor(white: 0, alpha: 0.5)])
        
        let blackLayer = CALayer()
        blackLayer.frame = CGRect(x: 0, y: bounds.maxY - 40, width: bounds.maxX, height: 40)
        blackLayer.backgroundColor = UIColor.black.cgColor
        layer.addSublayer(blackLayer)
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
