//
//  MovieDetailsCVCell.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/16/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class MovieDetailsCVCell: UICollectionViewCell {
    
    
@IBOutlet weak var textViewHC: NSLayoutConstraint!
    @IBOutlet weak var summary: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func adjustTextView() {
        textViewHC.constant = self.summary.contentSize.height

    }
    
}
