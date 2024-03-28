//___FILEHEADER___

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___RouterProtocol {
}

class ___VARIABLE_ModuleName___Router {
    
    private weak var viewController: ___VARIABLE_ModuleName___ViewController?
    
    public func start() -> ___VARIABLE_ModuleName___ViewController {
        let presenter = ___VARIABLE_ModuleName___Presenter(
            router: self
        )
        
        let view = ___VARIABLE_ModuleName___ViewController(presenter: presenter)
        
        presenter.view = view
        self.viewController = view
        
        return view
    }
}

extension ___VARIABLE_ModuleName___Router: ___VARIABLE_ModuleName___RouterProtocol {
}
