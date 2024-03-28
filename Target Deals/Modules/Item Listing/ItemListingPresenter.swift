//
//  ItemListingPresenter.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation

class ItemListingPresenter {
    private let router: ItemListingRouterProtocol
    weak var view: ItemListingViewProtocol?
    private let interactor: ItemListingInteractorProtocol
    var listData: [ItemListCellData] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                view?.updateListData()
            }
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
        print(error)
    }
}

fileprivate struct ItemListingAPIConfiguration: APIConfiguration {
    let api: API = .itemList
}
