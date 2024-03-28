//
//  ItemDetailsViewController.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

protocol ItemDetailsViewDelegate {
    func viewDidLoaded()
    var productId: Int { get }
    var productDetails: ItemDetailsData? { get }
}


protocol ItemDetailsViewProtocol: AnyObject {
    func showProductDetailsData()
}

class ItemDetailsViewController: UIViewController {
    let presenter: ItemDetailsViewDelegate
    let scrollView: UIScrollView = UIScrollView()
    let contentView: UIView = UIView(frame: .zero)
    let productBannerView: ProductDetailsView = ProductDetailsView(frame: .zero)
    let productDescriptionView: ProductDescriptionView = ProductDescriptionView(frame: .zero)
    init(presenter: ItemDetailsViewDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        title = "Detail"
        presenter.viewDidLoaded()
        scrollView.backgroundColor = UIColor.secondarySystemBackground
        (view.addSubview(scrollView, considerSafeArea: true, with: [
            .top(),
            .bottom(),
            .leading(),
            .trailing()
        ])
        +
        scrollView.addSubview(contentView, with: [
            .top(),
            .bottom(),
            .leading(),
            .trailing()
        ])
        +
        contentView.addSubview(productBannerView, with: [
            .top(),
            .leading(),
            .trailing()
        ])
        +
        contentView.addSubview(productDescriptionView, considerSafeArea: true, with: [
            .top(constant: 16, from: productBannerView.bottomAnchor),
            .leading(),
            .trailing(),
            .bottom()
            
        ])).activate()
    }
}

extension ItemDetailsViewController: ItemDetailsViewProtocol {
    func showProductDetailsData() {
        guard let productDetails = presenter.productDetails else { return }
        productBannerView.configure(data: productDetails)
        productDescriptionView.configure(data: productDetails)
    }
}
