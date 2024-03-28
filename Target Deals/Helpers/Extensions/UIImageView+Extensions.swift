//
//  UIImageView+Extensions.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let resultImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = resultImage
                    }
                }
            }
        }
    }
}
