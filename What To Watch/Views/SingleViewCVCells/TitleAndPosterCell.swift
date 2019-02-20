//
//  TitleAndPosterCell.swift
//  What To Watch
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class TitleAndPosterCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let posterImageView: CustomImageView = {
        
        // 3.25 X 4.75 aspect ratio for image
        
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
 
    let borderView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    func setupViews() {
        
        addSubview(borderView)
        addSubview(posterImageView)
        addSubview(titleLabel)
        
        addConstraintsWithFormat(format: "V:[v0]-16-[v1(80)]", views: posterImageView, titleLabel)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: titleLabel)
        
        // Top Poster constraint
        addConstraint(NSLayoutConstraint(item: posterImageView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: 1,
                                         constant: 32))
        // center X Poster Constraint
        addConstraint(NSLayoutConstraint(item: posterImageView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0.0))
        // Height Poster Constraint
        addConstraint(NSLayoutConstraint(item: posterImageView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .height,
                                         multiplier: 0,
                                         constant: 340))
        // Width Poster Constraint
        addConstraint(NSLayoutConstraint(item: posterImageView,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .width,
                                         multiplier: 0,
                                         constant: 232.6))
        
        // Border Constraints
        
        // Top Border constraint
        addConstraint(NSLayoutConstraint(item: borderView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: 1,
                                         constant: 30))
        // center X Border Constraint
        addConstraint(NSLayoutConstraint(item: borderView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0.0))
        // Height Border Constraint
        addConstraint(NSLayoutConstraint(item: borderView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .height,
                                         multiplier: 0,
                                         constant: 344))
        // Width Border Constraint
        addConstraint(NSLayoutConstraint(item: borderView,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .width,
                                         multiplier: 0,
                                         constant: 234.6))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
