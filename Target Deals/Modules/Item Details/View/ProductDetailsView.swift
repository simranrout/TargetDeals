//
//  ProductDetailsView.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

final class ProductDetailsView: UIView {
    let productImageView: UIImageView = UIImageView()
    private let containerView: UIStackView = UIStackView().axis(.vertical).spacing(28)
    
    private let priceDetailsView: UIStackView = UIStackView().axis(.horizontal).spacing(4)
    private let salePriceLabel: UILabel = UILabel()
    private let regularPriceLabel: UILabel = UILabel()
    
    private let productDetailsView: UIStackView = UIStackView().axis(.vertical).spacing(11)
    private let productTitleLabel: UILabel = UILabel()
    private let fulfillmentLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        intialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductDetailsView {
    func intialSetup() {
        backgroundColor = .white
        let containerView = setupContainerView()
        let productImageView = setupProductImageView()
        
        setupTitleView()
        (containerView + productImageView).activate()
    }
    
    func setupContainerView() -> Constraints {
        return addSubview(containerView, with: [
            .top(constant: 16),
            .bottom(constant: 10),
            .leading(constant: 16),
            .trailing(constant: 16)
        ])
    }
    
    func setupProductImageView() -> Constraints {
        containerView.addArrangedSubview(productImageView)
        productImageView.contentMode = .scaleAspectFill
        productImageView.cornerRadius(8)
        return productImageView.addConstraints(in: containerView, with: [
            .aspectRatio(multiplier: 1),
            .height(constant: 343)
        ])
    }
    
    func setupTitleView() {
        containerView.addArrangedSubview(productDetailsView)
        
        productTitleLabel.textColor = .black
        productTitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        productTitleLabel.numberOfLines = 0
        
        productDetailsView.addArrangedSubviews(productTitleLabel)
        setupPriceView()
        productDetailsView.setCustomSpacing(.zero, after: priceDetailsView)
        
    }
    
    func setupPriceView() {
        salePriceLabel.textColor = UIColor(r: 170)
        salePriceLabel.font = .systemFont(ofSize: 21, weight: .heavy)
        salePriceLabel.numberOfLines = 1
        salePriceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        regularPriceLabel.textColor = UIColor(51)
        regularPriceLabel.font = .systemFont(ofSize: 12, weight: .thin)
        regularPriceLabel.numberOfLines = 1
        priceDetailsView.addArrangedSubviews(salePriceLabel, regularPriceLabel)
        
        fulfillmentLabel.textColor = UIColor(102)
        fulfillmentLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        productDetailsView.addArrangedSubviews(priceDetailsView, fulfillmentLabel)
    }
}

extension ProductDetailsView {
    func configure(data: ItemDetailsData) {
        salePriceLabel.isHidden = data.salePrice == nil
        salePriceLabel.text = data.salePrice?.displayString
        
        regularPriceLabel.isHidden = data.regularPrice == nil
        regularPriceLabel.text = data.regularPrice?.displayString
        
        productTitleLabel.text = data.title
        productTitleLabel.isHidden = data.title.isEmpty
        
        fulfillmentLabel.text = data.fulfillment
        fulfillmentLabel.isHidden = data.fulfillment.isEmpty
        
        productImageView.isHidden = data.url == nil
        if let imageUrl = data.url {
            productImageView.setImage(from: imageUrl)
        }
    }
}
