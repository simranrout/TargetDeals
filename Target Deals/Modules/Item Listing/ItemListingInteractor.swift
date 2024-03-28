//
//  ItemListingInteractor.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation

protocol ItemListingInteractorDelegate: AnyObject {
    func recieveListingData(data: ItemListingData)
    func listingDataError(error: Error)
}

protocol ItemListingInteractorProtocol {
    func fetchListingData(with config: APIConfiguration)
}

final class ItemListingInteractor: ItemListingInteractorProtocol {
    private let networkManager: NetworkLayerManager = NetworkLayerManager<ItemListingData>()
    weak var presenter: ItemListingInteractorDelegate?
    
    func fetchListingData(with config: APIConfiguration) {
        networkManager.request(apiConfig: config) { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let listData):
                presenter?.recieveListingData(data: listData)
            case .failure(let error):
                presenter?.listingDataError(error: error)
            }
        }
    }
}
