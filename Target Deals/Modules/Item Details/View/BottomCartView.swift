//
//  BottomCartView.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

class BottomCartView: UIView {
    
    let button: UIButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        cornerRadius(8)
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMinYCorner]
        addShadow(radius: 2, offset: CGSize(width: 0, height: -1))
        backgroundColor = .white
        setupBottom()
    }
    
    private func setupBottom() {
       
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .red
        button.setTitle("Add to cart", for: .normal)
        button.titleLabel?.textColor = .white
        addSubview(button, considerSafeArea: true, with: [
            .top(constant: 16),
            .bottom(constant: 16),
            .leading(constant: 16),
            .trailing(constant: 16)
        ]).activate()
    }
}
