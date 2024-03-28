//
//  ItemDetailsRouter.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

protocol ItemDetailsRouterProtocol {
}

final class ItemDetailsRouter {
    
    private weak var viewController: ItemDetailsViewController?
    
    public func start(productId: Int) -> ItemDetailsViewController {
        let interactor = ItemDetailsInteractor()
        let presenter = ItemDetailsPresenter(
            router: self,
            interactor: interactor, productId: productId
        )
        
        let view = ItemDetailsViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        self.viewController = view
        
        return view
    }
}

extension ItemDetailsRouter: ItemDetailsRouterProtocol {
}
