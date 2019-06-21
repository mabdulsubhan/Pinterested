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
        return allPinboardViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pinboardCell: PinboardCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = allPinboardViewModels[indexPath.row]
        pinboardCell.populateWithViewModel(cellViewModel: cellViewModel)
        return pinboardCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator.navigateToPinDetail(withPin: allPinboardViewModels[indexPath.row].pin)
    }
}

extension PinboardViewController: PinterestedCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let originalHeight = CGFloat(allPinboardViewModels[indexPath.row].imageHeight)
        let originalWidth = CGFloat(allPinboardViewModels[indexPath.row].imageWidth)
        let ratio = originalHeight/originalWidth
        let newWidth = UIScreen.main.bounds.maxX/2
        let newHeight = newWidth * ratio
        return newHeight * 2.5
    }
    
}

extension PinboardViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshControl.updateProgress(with: scrollView.contentOffset.y)
        
        if scrollView.isAtBottom() {
            // This can be used to further call the API
            // But -> TODO: Keep page numbers (since they are not in the API as of now, i'm omitting it)
            // getPins()
        }
    }
}
