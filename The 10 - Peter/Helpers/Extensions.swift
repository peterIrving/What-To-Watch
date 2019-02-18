//
//  Extensions.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIColor {
    
    static func getCrimson() -> UIColor{
        return UIColor(red: 126/255, green: 34/255, blue: 19/255, alpha: 1)
    }
    static func getRed() -> UIColor{
        return UIColor(red: 171/255, green: 2/255, blue: 3/255, alpha: 1)
    }
    static func getGold() -> UIColor{
        return UIColor(red: 248/255, green: 203/255, blue: 62/255, alpha: 1)
    }
}
