//___FILEHEADER___

import Foundation

class ___VARIABLE_ModuleName___Presenter {
    private let router: ___VARIABLE_ModuleName___RouterProtocol
    weak var view: ___VARIABLE_ModuleName___ViewProtocol?
    private let interactor: ___VARIABLE_ModuleName___InteractorProtocol
    
    init(router: ___VARIABLE_ModuleName___RouterProtocol,
         interactor: ___VARIABLE_ModuleName___InteractorProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___ViewDelegate {
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___InteractorDelegate {
}
