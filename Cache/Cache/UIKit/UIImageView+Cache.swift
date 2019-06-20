//
//  UIImageView+Cache.swift
//  Cache
//
//  Created by Muhammad Abdul Subhan on 19/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private func downloadImageTask(url: URL) {
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("[CACHE] \(error)")
            }
            
            if let data = data, let downloadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = downloadedImage
                    CacheManager.shared.setObject(object: downloadedImage, forKey: url.absoluteString)
                }
            } else {
                print("[CACHE] Error converting data")
            }
        }
        
        dataTask.resume()
    }
    
    public func downloadImage(url: URL, placeholderImage: UIImage? = nil) {
        if let placeholder = placeholderImage {
            self.image = placeholder
        }

        if let cachedImage: UIImage = CacheManager.shared.getObject(withKey: url.absoluteString) {
            self.image = cachedImage
        } else {
            downloadImageTask(url: url)
        }
    }
}
