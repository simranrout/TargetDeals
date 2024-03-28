//
//  ItemListingRouter.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation
import UIKit

protocol ItemListingRouterProtocol {
    func pushProductDetailsView(productId: Int)
}

class ItemListingRouter {
    var productId: Int = 0
    private weak var viewController: ItemListingViewController?
    
    public func start() -> ItemListingViewController {
        let interactor = ItemListingInteractor()
        let presenter = ItemListingPresenter(
            router: self,
            interactor: interactor
        )
        
        let view = ItemListingViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        self.viewController = view
        
        return view
    }
}

extension ItemListingRouter: ItemListingRouterProtocol {
    func pushProductDetailsView(productId: Int) {
        viewController?.navigationController?.pushViewController(ItemDetailsRouter().start(productId: productId), animated: true)
    }
}
