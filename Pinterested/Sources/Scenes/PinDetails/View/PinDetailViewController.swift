//
//  PinDetailViewController.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit
import Hero

/// PinDetailViewController
class PinDetailViewController: UIViewController {

    /// Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    var pin: Pin?
    
    /// View Lifcycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        showPinImage()
        view.backgroundColor = UIColor.primaryColor
        imageView.hero.id = pin?.identifier
    }
    
    /// Actions
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /// View Binding
    func showPinImage() {
        if let pin = pin,
            let url = URL(string: pin.urls.raw + "?w=1200") {
            self.imageView.downloadImage(url: url)
        }
    }


}
