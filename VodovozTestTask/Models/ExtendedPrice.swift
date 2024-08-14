//
//  ExtendedPrice.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

struct ExtendedPrice: Codable {
    let price, oldPrice, quantityFrom, quantityTo: Int

    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
        case oldPrice = "OLD_PRICE"
        case quantityFrom = "QUANTITY_FROM"
        case quantityTo = "QUANTITY_TO"
    }
}
