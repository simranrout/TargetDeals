//
//  ItemDetailsEntity.swift
//  Target Deals
//
//  Created by Simran Rout on 28/03/24.
//

import Foundation
import UIKit

struct ItemDetailsData: Decodable {
    let id: Int
    let title, aisle, description: String
    let imageUrl: String
    let regularPrice, salePrice: Price?
    let fulfillment, availability: String
    
    // MARK: - Price
    struct Price: Decodable {
        let amountInCents: Int
        let currencySymbol, displayString: String
    }
    
    var url: URL? {
        return URL(string: imageUrl)
    }
}

