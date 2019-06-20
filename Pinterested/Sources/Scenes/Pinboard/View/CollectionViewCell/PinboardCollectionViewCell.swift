//
//  PinboardCollectionViewCell.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit
import Hero
import Cache

class PinboardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelBackView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
        
    override func layoutSubviews() {
        super.layoutSubviews()
//        labelBackView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 10)
//        backView.roundCorners(corners: [.topLeft, .topRight], radius: 10)
//        imageView.layer.cornerRadius = 10
//        imageView.layer.masksToBounds = true
    }
    
    func populateWithViewModel(cellViewModel: PinboardCollectionCellViewModel) {
        if let url =  cellViewModel.thumbImageURL {
            imageView.downloadImage(url: url, placeholderImage: UIImage(named: "imagePlaceholder"))
        }
        
        nameLabel.text = cellViewModel.username
        timeLabel.text = cellViewModel.time
        imageView.hero.id = cellViewModel.pinIdentifier
        backView.backgroundColor = cellViewModel.color
    }

}