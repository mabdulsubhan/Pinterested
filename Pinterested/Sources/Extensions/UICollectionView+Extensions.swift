//
//  UICollectionView+Extensions.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    /// Method which registers a cellType T with xib name T from bundle
    ///
    /// - Parameters:
    ///   - cellType: Cell custom class
    ///   - bundle: Bundle specifier
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle = .main) {
        let className = String(describing: cellType.self)
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    
    /// Deques a cell of type T for indexPath
    ///
    /// - Parameter indexPath: index path of the current cell
    /// - Returns: Generic cell class
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
}

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {}
