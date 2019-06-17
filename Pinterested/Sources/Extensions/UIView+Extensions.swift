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
        layer.addSublayer(gradient)
    }

    private func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        layer.insertSublayer(gradient, at: 0)
    }
    
    
    /// Adds a gradient layer on top and bottom of the view
    func addBorderGradients() {
        addBlackGradientLayerInForeground(frame: CGRect(x: 0, y: 0, width: frame.maxX, height: 100), colors: [.black, .clear])
        addBlackGradientLayerInForeground(frame: CGRect(x: 0, y: frame.maxY - 100, width: frame.maxX, height: 100), colors: [.clear, .black])
    }
}

