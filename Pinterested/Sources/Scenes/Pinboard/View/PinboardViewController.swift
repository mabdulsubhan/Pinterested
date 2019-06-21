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
    
    lazy var dataProvider: PinboardDataProvider = {
       let provider = PinboardDataProvider()
        provider.pinboardService = PinboardService()
        provider.delegate = self
        return provider
    }()

    lazy var coordinator: PinboardCoordinator = {
        let coor = PinboardCoordinator(view: self)
        return coor
    }()
    
    lazy var refreshControl: LottieRefreshControl = {
        let refresher = LottieRefreshControl(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 300))
        refresher.addTarget(self, action: #selector(reloadView), for: .valueChanged)
        return refresher
    }()

    var allPinboardViewModels = [PinboardCollectionCellViewModel]() {
        didSet {
            self.pinboardCollectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    /// View Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPins()
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
        getPins()
    }
    
    private func getPins() {
        dataProvider.providePins()
    }
}

extension PinboardViewController: PinboardDataProviderDelegate {

    func onSuccess(_ pinArray: [Pin]) {
        allPinboardViewModels = pinArray.map { PinboardCollectionCellViewModel.init($0) }
    }
    
    func onFailure(_ error: NetworkError) {
        self.refreshControl.endRefreshing()
        UIAlertController.showAlert(withMessage: error.localizedDescription)
    }

}
