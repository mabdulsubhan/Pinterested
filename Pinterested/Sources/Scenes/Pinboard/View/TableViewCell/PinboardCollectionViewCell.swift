//
//  PinboardCollectionViewCell.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

class PinboardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func populateWithViewModel(cellViewModel: PinboardTableCellViewModel) {
        if let url =  cellViewModel.thumbImageURL {
            imageView.kf.setImage(with: url)
        }
    }

}
