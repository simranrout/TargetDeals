//___FILEHEADER___

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___ViewDelegate {
}

protocol ___VARIABLE_ModuleName___ViewProtocol: AnyObject {
}

class ___VARIABLE_ModuleName___ViewController: UIViewController {
    let presenter: ___VARIABLE_ModuleName___ViewDelegate

    init(presenter: ___VARIABLE_ModuleName___ViewDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ___VARIABLE_ModuleName___ViewController: ___VARIABLE_ModuleName___ViewProtocol {
}
