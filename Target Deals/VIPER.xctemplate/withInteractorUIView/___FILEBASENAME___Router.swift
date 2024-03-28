//___FILEHEADER___

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___RouterProtocol {
}

class ___VARIABLE_ModuleName___Router {
    
    private weak var view: ___VARIABLE_ModuleName___View?
    
    public func start() -> ___VARIABLE_ModuleName___View {
        let interactor = ___VARIABLE_ModuleName___Interactor()
        let presenter = ___VARIABLE_ModuleName___Presenter(
            router: self,
            interactor: interactor
        )
        
        let view = ___VARIABLE_ModuleName___View(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        self.view = view
        
        return view
    }
}

extension ___VARIABLE_ModuleName___Router: ___VARIABLE_ModuleName___RouterProtocol {
}
