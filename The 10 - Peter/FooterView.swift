//
//  FooterView.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/14/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

@IBDesignable
class FooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setup() {
        let view = loadViewFromNib()
        view!.frame = bounds
        
        view!.frame = bounds
        
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
}
