//
//  Array+NSLayoutConstraint+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import UIKit

public extension Array where Element == NSLayoutConstraint {
    @inlinable mutating func addConstraint(_ newConstraint: Element) {
        self.append(newConstraint)
    }
    
    @inlinable mutating func addConstraints(_ newConstraints: [Element]) {
        self.append(contentsOf: newConstraints)
    }
    
    /// If you need to chain constraint
    @discardableResult func addAndReturnConstraint(_ newConstraint: Element) -> Self {
        var currentConstraints = self
        currentConstraints.append(newConstraint)
        return currentConstraints
    }
    
    /// If you need to chain constraints
    @discardableResult func addAndReturnConstraints(_ newConstraints: [Element]) -> Self {
        var currentConstraints = self
        currentConstraints.append(contentsOf: newConstraints)
        return currentConstraints
    }
    
    func activate() {
        NSLayoutConstraint.activate(self)
    }
}

