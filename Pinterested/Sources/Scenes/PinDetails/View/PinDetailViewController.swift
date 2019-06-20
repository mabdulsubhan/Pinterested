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
    
    /// Injected Properties
    var viewModel: PinDetailViewModel!
    
    
    /// View Lifcycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModelOutput()
        viewModel.viewDidLoad()
        view.backgroundColor = UIColor.primaryColor
        imageView.hero.id = viewModel.pinIdentifier
    }
    
    /// Actions
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /// View Binding
    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }

            switch output {
            case .showPinImageView(let url):
                self.imageView.downloadImage(url: url)
                
            }
        }
    }


}
