//
//  UIImageView+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from url: URL, with placeholder: UIImage? = UIImage(named: "NoImage")) {
        NetworkLayerManager<Data>().download(with: url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                image = UIImage(data: data)
            case .failure(let failure):
                debugPrint(failure)
                image = placeholder
            }
        }
    }
}
