//
//  ShowCell.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import UIKit
import WebImage

class ShowCollectionCell: UICollectionViewCell {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!

    var show: Show! {
        didSet {
            titleLabel.text = show!.title
            thumbnailImageView.sd_setImageWithURL(NSURL(string: show!.image))
        }
    }
    
}