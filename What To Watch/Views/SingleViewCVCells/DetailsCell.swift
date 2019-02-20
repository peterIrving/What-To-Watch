//
//  DetailsCell.swift
//  What To Watch
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class DetailsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    let detailLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Details: "
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let divider: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let genreLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Genre: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let languageLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Language: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let releaseDateLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Release date: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private func setupCell() {
        
        addSubview(detailLabel)
        addSubview(divider)
        addSubview(genreLabel)
        addSubview(languageLabel)
        addSubview(releaseDateLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-8-|", views: detailLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: divider)
        addConstraintsWithFormat(format: "H:|-12-[v0]-8-|", views: genreLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-8-|", views: languageLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-8-|", views: releaseDateLabel)
        
        addConstraintsWithFormat(format: "V:|-24-[v0]-4-[v1(1)]-8-[v2]-12-[v3]-12-[v4]", views: detailLabel, divider, genreLabel, languageLabel, releaseDateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
