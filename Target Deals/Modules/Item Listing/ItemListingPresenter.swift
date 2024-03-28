//
//  ItemListingPresenter.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation

final class ItemListingPresenter {
    weak var view: ItemListingViewProtocol?
    private let router: ItemListingRouterProtocol
    private let interactor: ItemListingInteractorProtocol
    var listData: [ItemListCellData] = [] {
        didSet {
            view?.updateListData()
        }
    }
    
    init(router: ItemListingRouterProtocol,
         interactor: ItemListingInteractorProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ItemListingPresenter: ItemListingViewDelegate {
    func productCellTapped(productId: Int) {
        router.pushProductDetailsView(productId: productId)
    }
    
    func viewDidLoad() {
        interactor.fetchListingData(with: ItemListingAPIConfiguration())
    }
}

extension ItemListingPresenter: ItemListingInteractorDelegate {
    func recieveListingData(data: ItemListingData) {
        listData = data.products.compactMap({$0.itemListCellData})
    }
    
    func listingDataError(error: Error) {
        debugPrint(error)
    }
}

fileprivate struct ItemListingAPIConfiguration: APIConfiguration {
    let api: API = .itemList
}
