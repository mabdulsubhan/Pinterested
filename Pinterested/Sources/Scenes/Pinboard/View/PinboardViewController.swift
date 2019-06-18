//
//  PinboardViewController.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit
import SVProgressHUD

/// PinboardViewController
class PinboardViewController: UIViewController {
    
    /// Outlets
    @IBOutlet weak var pinboardCollectionView: UICollectionView!
    @IBOutlet var noDataView: UIView!
    
    var datePickerTopConstraint = NSLayoutConstraint()
    var viewModel: PinboardViewModelProtocol!
 
    
    /// View Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModelOutput()
        viewModel.didLoad()
    }
  
    /// Methods
    private func setupUI() {
        pinboardCollectionView.register(cellType: PinboardCollectionViewCell.self)
        pinboardCollectionView.backgroundView = noDataView
        if let layout = pinboardCollectionView?.collectionViewLayout as? PinterestedCollectionViewLayout {
            layout.delegate = self
        }
    }

    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            
            switch output {
            case .reloadPins:
                self.pinboardCollectionView.reloadData()
            case .showActivityIndicator(let show):
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
            case .showError(let error):
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            }
        }
    }
}
