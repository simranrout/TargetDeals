//
//  UIColor+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import UIKit

public extension UIColor {
    convenience init(r: Int = 0, g: Int = 0, b: Int = 0, a: CGFloat = 1) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
    }
    
    convenience init(_ value: Int, alpha a: CGFloat = 1) {
        self.init(red: CGFloat(value)/255, green: CGFloat(value)/255, blue: CGFloat(value)/255, alpha: a)
    }
}
