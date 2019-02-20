//
//  PreviewCVCell.swift
//  What To Watch
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
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "hey"
        label.textColor = UIColor.getGold()
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    // I want it to stay highlighted when I scroll...
    override var isHighlighted: Bool {
        didSet{
            backdropImageView.alpha = isHighlighted ? 0.3 : 1.0
            titleLabel.isHidden = isHighlighted ? false : true
        }
    }
    
    func setupViews() {
        self.backgroundColor = .black
        
        addSubview(backdropImageView)
        addSubview(titleLabel)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: backdropImageView)
        addConstraintsWithFormat(format: "H:|-6-[v0]-6-|", views: backdropImageView)
        addConstraintsWithFormat(format: "V:|-24-[v0]-24-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-24-[v0]-24-|", views: titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

