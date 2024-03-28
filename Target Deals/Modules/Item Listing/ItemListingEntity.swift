//
//  ItemListingEntity.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation
import UIKit

struct ItemListingData: Decodable {
    let products: [Product]
    
    // MARK: Product
    struct Product: Decodable {
        let id: Int
        let title, aisle, description: String
        let imageUrl: String
        let regularPrice: Price
        let fulfillment: String
        let availability: String
        let salePrice: Price?
        
        // MARK: Price
        struct Price: Decodable {
            let amountInCents: Int
            let currencySymbol: String
            let displayString: String
        }
    }
}

extension ItemListingData.Product {
    var itemListCellData: ItemListCellData {
        let availabilityAttributeString = NSAttributedString(string: availability, attributes: [.foregroundColor: UIColor.green.cgColor])
        let aisleAttributeString = NSAttributedString(string: " in aisle \(aisle)", attributes: [.foregroundColor: UIColor.gray.cgColor])
        let mutuableAttributeString = NSMutableAttributedString(attributedString: availabilityAttributeString)
        mutuableAttributeString.append(aisleAttributeString)
        return ItemListCellData(
            id: id, imageUrl: URL(string: imageUrl),
            discountedPrice: salePrice?.displayString ?? "",
            regularPrice: "reg. \(regularPrice.displayString)",
            title: title,
            fulfillment: fulfillment,
            availability: mutuableAttributeString
        )
    }
}

struct ItemListCellData {
    let id: Int
    let imageUrl: URL?
    let discountedPrice: String
    let regularPrice: String
    let title: String
    let fulfillment: String
    let availability: NSAttributedString
}
