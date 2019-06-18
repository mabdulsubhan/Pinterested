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
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var pinboardTableview: UITableView!
    @IBOutlet weak var datePickerView: DatePickerView!
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
    
    /// Outlet Actions
    @IBAction func onRightBarButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.performCTA()
    }
  
    /// Methods
    private func setupUI() {
        setupDatePickerView()
        pinboardTableview.register(cellType: PinboardTableViewCell.self)
        pinboardTableview.backgroundView = noDataView
    }

    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            
            switch output {
            case .reloadPins:
                self.pinboardTableview.reloadData()
            case .showActivityIndicator(let show):
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
            case .showError(let error):
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            case .showDatePicker(let show):
                (show) ? self.showDatePicker()  :  self.hideDatePicker()
            case .showFilterImage(let show):
                self.rightBarButton.image = show ? UIImage(named: "resetIcon") : UIImage(named: "filterIcon")
            }
        }
    }
}
