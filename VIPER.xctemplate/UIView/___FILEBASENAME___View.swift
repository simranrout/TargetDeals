//___FILEHEADER___

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___ViewDelegate {
}

protocol ___VARIABLE_ModuleName___ViewProtocol: AnyObject {
}

class ___VARIABLE_ModuleName___View: UIView {
    let presenter: ___VARIABLE_ModuleName___ViewDelegate

    init(presenter: ___VARIABLE_ModuleName___ViewDelegate) {
        self.presenter = presenter
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ___VARIABLE_ModuleName___View: ___VARIABLE_ModuleName___ViewProtocol {
}
