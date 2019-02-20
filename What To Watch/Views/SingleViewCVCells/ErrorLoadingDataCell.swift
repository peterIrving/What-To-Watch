//
//  ErrorCell.swift
//  What To Watch
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class ErrorLoadingDataCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Error Loading Data"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupLabel() {
        
        addSubview(titleLabel)
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-16-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
