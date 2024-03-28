//
//  ItemDetailsInteractor.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation

protocol ItemDetailsInteractorDelegate: AnyObject {
    func recieveProductDetails(data: ItemDetailsData)
    func productDetailsDataError(error: Error)
}

protocol ItemDetailsInteractorProtocol {
    func fetchProductDetails(with config: APIConfiguration)
}

class ItemDetailsInteractor: ItemDetailsInteractorProtocol {
    private let networkManager: NetworkLayerManager = NetworkLayerManager<ItemDetailsData>()
    weak var presenter: ItemDetailsInteractorDelegate?
    
    func fetchProductDetails(with config: APIConfiguration) {
        networkManager.request(apiConfig: config) { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let listData):
                presenter?.recieveProductDetails(data: listData)
            case .failure(let error):
                presenter?.productDetailsDataError(error: error)
            }
        }
    }
}
