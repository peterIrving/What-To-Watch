//
//  PreviewCVCell.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/14/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class ListViewCVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupViews()
    }
    
    let backdropImageView: CustomImageView = {
        
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
    func setupViews() {
        self.backgroundColor = .black
        
        addSubview(backdropImageView)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: backdropImageView)
        addConstraintsWithFormat(format: "H:|-6-[v0]-6-|", views: backdropImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

