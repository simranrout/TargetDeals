//
//  ItemDetailsPresenter.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation

final class ItemDetailsPresenter {
    private let router: ItemDetailsRouterProtocol
    weak var view: ItemDetailsViewProtocol?
    private let interactor: ItemDetailsInteractorProtocol
    var productId: Int
    
    var productDetails: ItemDetailsData? = nil {
        didSet(newValue) {
            view?.showProductDetailsData()
        }
    }
    
    init(router: ItemDetailsRouterProtocol,
         interactor: ItemDetailsInteractorProtocol, productId: Int ) {
        self.productId = productId
        self.interactor = interactor
        self.router = router
    }
}

extension ItemDetailsPresenter: ItemDetailsViewDelegate {
    func viewDidLoaded() {
        interactor.fetchProductDetails(with: ProductDetailsAPI(api: .itemDetails(pageId: productId)))
    }
    
}

extension ItemDetailsPresenter: ItemDetailsInteractorDelegate {
    func recieveProductDetails(data: ItemDetailsData) {
        productDetails = data
    }
    
    func productDetailsDataError(error: Error) {
        debugPrint(error)
    }
}

fileprivate struct ProductDetailsAPI: APIConfiguration {
    var api: API
}
