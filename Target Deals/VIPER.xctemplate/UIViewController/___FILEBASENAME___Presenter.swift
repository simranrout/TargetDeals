//___FILEHEADER___

import Foundation

class ___VARIABLE_ModuleName___Presenter {
    private let router: ___VARIABLE_ModuleName___RouterProtocol
    weak var view: ___VARIABLE_ModuleName___ViewProtocol?
    
    init(router: ___VARIABLE_ModuleName___RouterProtocol) {
        self.router = router
    }
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___ViewDelegate {
}
