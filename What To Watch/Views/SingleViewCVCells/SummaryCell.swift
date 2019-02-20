//
//  SummaryCell.swift
//  What To Watch
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class SummaryCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    let summaryLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Summary: "
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let divider: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let summaryTextView: UITextView = {
        
        let textView = UITextView()
        textView.textColor = UIColor.white
        textView.backgroundColor = .clear
        textView.isSelectable = true
        textView.font = UIFont.systemFont(ofSize: 20.0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    func setupCell() {
        
        addSubview(summaryLabel)
        addSubview(divider)
        addSubview(summaryTextView)

        addConstraintsWithFormat(format: "H:|-12-[v0]-8-|", views: summaryLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: divider)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: summaryTextView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-4-[v1(1)]-8-[v2]", views: summaryLabel, divider, summaryTextView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
