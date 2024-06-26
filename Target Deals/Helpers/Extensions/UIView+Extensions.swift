//
//  UIView+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import UIKit

public extension UIView {
    
    @discardableResult func addShadow(radius: CGFloat = 1, colour: UIColor = .black, opacity: Float = 0.5, offset: CGSize = CGSize(width: 1, height: 1)) -> Self {
        layer.shadowColor = colour.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
        return self
    }
    
    @discardableResult func cornerRadius(_ radius: CGFloat, maskToBounds: Bool = true) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = maskToBounds
        return self
    }
 
    
    func addSubview(_ subView: UIView, considerSafeArea: Bool = false, with constraints: Array<Constraint>) -> Constraints {
        addSubview(subView)
        return subView.addConstraints(in: self, considerSafeArea: considerSafeArea, with: constraints)
    }
    
    func addConstraints(in view: UIView, considerSafeArea: Bool = false, with constraints: Array<Constraint>) -> Constraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        return constraints.map({ constraint in
            switch constraint {
            case .leading(let constant, let anchor, let priority):
                let leading = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor)
                return leading.constraint(equalTo: leadingAnchor, constant: -constant).atPriority(priority)
                
            case .top(let constant, let anchor, let priority):
                let top = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor)
                return top.constraint(equalTo: topAnchor, constant: -constant).atPriority(priority)
                
            case .trailing(let constant, let anchor, let priority):
                let trailing = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor)
                return trailing.constraint(equalTo: trailingAnchor, constant: constant).atPriority(priority)
                
            case .bottom(let constant, let anchor, let priority):
                let bottom = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor)
                return bottom.constraint(equalTo: bottomAnchor, constant: constant).atPriority(priority)
                
            case .centerX(let constant, let anchor, let priority):
                let centerX = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor)
                return centerX.constraint(equalTo: centerXAnchor, constant: constant).atPriority(priority)
                
            case .centerY(let constant, let anchor, let priority):
                let centerY = anchor ?? (considerSafeArea ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor)
                return centerY.constraint(equalTo: centerYAnchor, constant: constant).atPriority(priority)
                
            case .height(let constant, let equalTo, let priority):
                if let height = equalTo {
                    return heightAnchor.constraint(equalTo: height, constant: constant).atPriority(priority)
                } else {
                    return heightAnchor.constraint(equalToConstant: constant).atPriority(priority)
                }
                
            case .width(let constant, let equalTo, let priority):
                if let width = equalTo {
                    return widthAnchor.constraint(equalTo: width, constant: constant).atPriority(priority)
                } else {
                    return widthAnchor.constraint(equalToConstant: constant).atPriority(priority)
                }
                
            case .aspectRatio(let multiplier, let priority):
                return widthAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier).atPriority(priority)
            }
        })
    }
}
