//
//  PriceDetail.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

struct PriceDetail: Codable {
    let price: Double
    let oldPrice: Double
    let quantityFrom: Int
    let quantityTo: Int

    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
        case oldPrice = "OLD_PRICE"
        case quantityFrom = "QUANTITY_FROM"
        case quantityTo = "QUANTITY_TO"
    }
}
