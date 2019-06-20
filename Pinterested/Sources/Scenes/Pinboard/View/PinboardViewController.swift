//
//  PinboardViewController.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

/// PinboardViewController
class PinboardViewController: UIViewController {
    
    /// Outlets
    @IBOutlet weak var pinboardCollectionView: UICollectionView!
    
    var datePickerTopConstraint = NSLayoutConstraint()
    var viewModel: PinboardViewModelProtocol!
    lazy var refreshControl: LottieRefreshControl = {
        let refresher = LottieRefreshControl(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 300))
        refresher.addTarget(self, action: #selector(reloadView), for: .valueChanged)
        return refresher
    }()

    
    /// View Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModelOutput()
        viewModel.didLoad()
    }
  
    /// Methods
    private func setupUI() {
        view.backgroundColor = UIColor.primaryColor
        pinboardCollectionView.register(cellType: PinboardCollectionViewCell.self)
        if let layout = pinboardCollectionView?.collectionViewLayout as? PinterestedCollectionViewLayout {
            layout.delegate = self
        }
        self.pinboardCollectionView.addSubview(refreshControl)
    }

    @objc
    func reloadView() {
        refreshControl.beginRefreshing()
        viewModel.reload()
    }
    
    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            
            switch output {
            case .reloadPins:
                self.pinboardCollectionView.reloadData()
                self.refreshControl.endRefreshing()
            case .showActivityIndicator(let show):
                break
//                show ? self.refreshControl.beginRefreshing() : self.refreshControl.endRefreshing()
            case .showError(let error):
                self.refreshControl.endRefreshing()
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            }
        }
    }
}
