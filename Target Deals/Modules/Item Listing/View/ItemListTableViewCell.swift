//
//  ItemListTableViewCell.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import UIKit

class ItemListTableViewCell: UITableViewCell, ReusableView {
    private let containerView: UIStackView = UIStackView().axis(.horizontal).spacing(16)
    private let productImageView: UIImageView = UIImageView()
    private let productDetailsView: UIStackView = UIStackView().axis(.vertical).spacing(8)
    private let priceDetailsView: UIStackView = UIStackView().axis(.horizontal).spacing(4)
    
    private let salePriceLabel: UILabel = UILabel()
    private let regularPriceLabel: UILabel = UILabel()
    
    private let fulfillmentLabel: UILabel = UILabel()
    private let productTitleLabel: UILabel = UILabel()
    private let avalabilityLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        selectionStyle = .none
        let containerConstraints = setupContainerStackView()
        let productImageConstraints = setupProductImageView()
        setupProductDetailsView()
        (containerConstraints + productImageConstraints).activate()
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
        super.prepareForReuse()
    }
    
    private func setupContainerStackView() -> Constraints {
        return contentView.addSubview(containerView, with: [
            .top(constant: 16),
            .bottom(constant: 16),
            .leading(constant: 16),
            .trailing(constant: 16)
        ])
        
    }
    
    private func setupProductImageView() -> Constraints {
        containerView.addArrangedSubview(productImageView)
        productImageView.contentMode = .scaleAspectFill
        productImageView.cornerRadius(8)
        return productImageView.addConstraints(in: containerView, with: [
            .aspectRatio(multiplier: 1),
            .height(constant: 140)
        ])
    }
    
    private func setupProductDetailsView() {
        containerView.addArrangedSubview(productDetailsView)
        setupPriceDetailsView()
        fulfillmentLabel.textColor = UIColor(102)
        fulfillmentLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        productTitleLabel.textColor = .black
        productTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        productTitleLabel.numberOfLines = 0
        
        avalabilityLabel.textColor = .black
        avalabilityLabel.font = .systemFont(ofSize: 14, weight: .regular)
        containerView.alignment = .top
        
        productDetailsView.addArrangedSubviews(fulfillmentLabel, productTitleLabel, avalabilityLabel)
        productDetailsView.setCustomSpacing(.zero, after: priceDetailsView)
    }
    
    private func setupPriceDetailsView() {
        salePriceLabel.textColor = UIColor(r: 170)
        salePriceLabel.font = .systemFont(ofSize: 21, weight: .heavy)
        salePriceLabel.numberOfLines = 1
        salePriceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        regularPriceLabel.textColor = UIColor(51)
        regularPriceLabel.font = .systemFont(ofSize: 12, weight: .thin)
        regularPriceLabel.numberOfLines = 1
        
        priceDetailsView.addArrangedSubviews(salePriceLabel, regularPriceLabel)
        productDetailsView.addArrangedSubview(priceDetailsView)
    }
   
    func configure(with data: ItemListCellData) {
        salePriceLabel.text = data.discountedPrice
        salePriceLabel.isHidden = data.discountedPrice.isEmpty
        
        regularPriceLabel.text = data.regularPrice
        regularPriceLabel.isHidden = data.regularPrice.isEmpty
        
        fulfillmentLabel.text = data.fulfillment
        fulfillmentLabel.isHidden = data.fulfillment.isEmpty
        
        productTitleLabel.text = data.title
        productTitleLabel.isHidden = data.discountedPrice.isEmpty
        
        avalabilityLabel.attributedText = data.availability
        guard let imageUrl = data.imageUrl else { return }
        productImageView.load(url: imageUrl)
        
    }
}
