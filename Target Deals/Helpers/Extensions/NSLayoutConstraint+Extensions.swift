//
//  NSLayoutConstraint+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import UIKit

public typealias Constraints = [NSLayoutConstraint]

public extension NSLayoutConstraint {
    func atPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}

public enum Constraint {
    case leading(constant: CGFloat = 0, from: NSLayoutXAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case top(constant: CGFloat = 0, from: NSLayoutYAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case trailing(constant: CGFloat = 0, from: NSLayoutXAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case bottom(constant: CGFloat = 0, from: NSLayoutYAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case centerX(constant: CGFloat = 0, from: NSLayoutXAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case centerY(constant: CGFloat = 0, from: NSLayoutYAxisAnchor? = nil, priority: UILayoutPriority = .required)
    case height(constant: CGFloat = 0, equalTo: NSLayoutDimension? = nil, priority: UILayoutPriority = .required)
    case width(constant: CGFloat = 0, equalTo: NSLayoutDimension? = nil, priority: UILayoutPriority = .required)
    case aspectRatio(multiplier: CGFloat = 1, priority: UILayoutPriority = .required)
}
