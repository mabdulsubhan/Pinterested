//
//  PinboardViewController+UITableView.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

extension PinboardViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPins
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pinboardCell: PinboardCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.getPinboardCellViewModel(index: indexPath.row)
        pinboardCell.populateWithViewModel(cellViewModel: cellViewModel)
        return pinboardCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectPin(index: indexPath.row)
    }
}

extension PinboardViewController: PinterestedCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return viewModel.getHeightOfPin(atIndex: indexPath.row)
    }
    
}

extension PinboardViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isAtBottom() {
            // TODO
//            viewModel.reload()
        }
    }
}
