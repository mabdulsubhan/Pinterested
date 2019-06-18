//
//  PinboardViewController+UITableView.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension PinboardViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPins
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pinboardCell: PinboardTableViewCell  = tableView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.getPinboardCellViewModel(index: indexPath.row)
        pinboardCell.populateWithViewModel(cellViewModel: cellViewModel)
        return pinboardCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectPin(index: indexPath.row)
    }
}

extension PinboardViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isAtBottom() {
            viewModel.tableViewDidReachToEnd()
        }
    }
}
