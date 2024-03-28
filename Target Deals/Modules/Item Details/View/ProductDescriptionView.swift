//
//  ProductDescriptionView.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

final class ProductDescriptionView: UIView {
    private let productDescriptionView: UIStackView = UIStackView().axis(.vertical).spacing(21)
    private let productDetailsLabel: UILabel = UILabel()
    private let productDescriptionLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        intialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductDescriptionView {
    func intialSetup() {
        backgroundColor = .white
        let containerView = setupContainerView()
        setupTitleView()
        containerView.activate()
    }
    
    func setupContainerView() -> Constraints {
        return addSubview(productDescriptionView, with: [
            .top(constant: 16),
            .bottom(constant: 16),
            .leading(constant: 16),
            .trailing(constant: 16)
        ])
    }
    
    func setupTitleView() {
        productDetailsLabel.textColor = .black
        productDetailsLabel.font = .systemFont(ofSize: 22, weight: .bold)
        productDetailsLabel.numberOfLines = 1
        
        productDescriptionLabel.textColor = UIColor(136)
        productDescriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        productDescriptionLabel.numberOfLines = 0
        
        productDescriptionView.addArrangedSubviews(productDetailsLabel, productDescriptionLabel)
    }
}

extension ProductDescriptionView {
    func configure(data: ItemDetailsData) {
        productDetailsLabel.text = "Product Details"
        productDescriptionLabel.text = data.description
    }
}
